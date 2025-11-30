extends Node2D

@onready var tile_map = $TileMap
@onready var crops_container = $Crops
@onready var objects_container = $Objects

# TileMap Layer Indices
const LAYER_GROUND = 0
const LAYER_SOIL = 1

# Tile IDs (Source IDs in TileSet)
const SOURCE_ID_SOIL = 1
const ATLAS_COORD_TILLED = Vector2i(0, 0)
const ATLAS_COORD_WATERED = Vector2i(0, 1)

var crop_scene = preload("res://crops/Crop.tscn")

# Data: { "x,y": { "id": "corn", "stage": 0, "days_grown": 0, "watered": false } }
var crops_data = {}

func _ready():
	add_to_group("world")
	TimeManager.connect("new_day", _on_new_day)

func on_player_use_tool(global_pos: Vector2, tool_type: int) -> bool:
	# 1. Check for ResourceObjects
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = global_pos
	query.collide_with_areas = true
	query.collide_with_bodies = true
	
	var results = space_state.intersect_point(query)
	for result in results:
		var collider = result.collider
		if collider.has_method("interact"):
			collider.interact(tool_type)
			return true

	# 2. Tile Interaction
	var map_pos = tile_map.local_to_map(global_pos)
	
	match tool_type:
		Global.ToolType.HOE:
			return till_soil(map_pos)
		Global.ToolType.WATERING_CAN:
			return water_soil(map_pos)
		Global.ToolType.PICKAXE:
			return untill_soil(map_pos)
	
	return false

func on_player_plant_seed(global_pos: Vector2, crop_id: String) -> bool:
	var map_pos = tile_map.local_to_map(global_pos)
	
	# Check if soil is tilled
	var tile_data = tile_map.get_cell_tile_data(LAYER_SOIL, map_pos)
	if not tile_data:
		return false # Must plant on tilled soil
	
	# Check if crop already exists
	var key = str(map_pos.x) + "," + str(map_pos.y)
	if crops_data.has(key):
		return false
		
	spawn_crop(map_pos, crop_id)
	return true

func till_soil(map_pos: Vector2i) -> bool:
	if tile_map.get_cell_source_id(LAYER_GROUND, map_pos) == -1:
		return false
	
	if tile_map.get_cell_source_id(LAYER_SOIL, map_pos) != -1:
		return false # Already tilled
		
	tile_map.set_cell(LAYER_SOIL, map_pos, SOURCE_ID_SOIL, ATLAS_COORD_TILLED)
	return true

func water_soil(map_pos: Vector2i) -> bool:
	if tile_map.get_cell_source_id(LAYER_SOIL, map_pos) != -1:
		tile_map.set_cell(LAYER_SOIL, map_pos, SOURCE_ID_SOIL, ATLAS_COORD_WATERED)
		
		var key = str(map_pos.x) + "," + str(map_pos.y)
		if crops_data.has(key):
			crops_data[key]["watered"] = true
			# Visual update handled by Crop node if needed, or reload
		return true
	return false

func untill_soil(map_pos: Vector2i) -> bool:
	if tile_map.get_cell_source_id(LAYER_SOIL, map_pos) != -1:
		tile_map.erase_cell(LAYER_SOIL, map_pos)
		
		var key = str(map_pos.x) + "," + str(map_pos.y)
		if crops_data.has(key):
			crops_data.erase(key)
			# Remove visual node
			for child in crops_container.get_children():
				if tile_map.local_to_map(child.position) == map_pos:
					child.queue_free()
					break
		return true
	return false

func spawn_crop(map_pos: Vector2i, crop_id: String, data = null):
	var crop = crop_scene.instantiate()
	crop.position = tile_map.map_to_local(map_pos)
	crops_container.add_child(crop)
	
	if data:
		crop.init(crop_id, data.stage)
		crops_data[str(map_pos.x) + "," + str(map_pos.y)] = data
	else:
		crop.init(crop_id, 0)
		crops_data[str(map_pos.x) + "," + str(map_pos.y)] = {
			"id": crop_id,
			"stage": 0,
			"days_grown": 0,
			"watered": false
		}

func _on_new_day():
	# Process crops
	for key in crops_data.keys():
		var data = crops_data[key]
		if data.watered:
			data.days_grown += 1
			# Simple growth logic: 1 day = 1 stage (for prototype)
			# Real logic: check crop definition
			var crop_def = Global.item_data.get(data.id) # Assuming crop item has growth info
			# For now, just increment stage every day if watered
			if data.stage < 3: # Max stage 3
				data.stage += 1
			
			data.watered = false
	
	# Dry out soil
	for cell in tile_map.get_used_cells(LAYER_SOIL):
		tile_map.set_cell(LAYER_SOIL, cell, SOURCE_ID_SOIL, ATLAS_COORD_TILLED)
	
	# Refresh visuals
	refresh_crops_visuals()

func refresh_crops_visuals():
	for child in crops_container.get_children():
		child.queue_free()
	
	for key in crops_data.keys():
		var parts = key.split(",")
		var map_pos = Vector2i(int(parts[0]), int(parts[1]))
		var data = crops_data[key]
		spawn_crop(map_pos, data.id, data)

func get_save_data():
	return {
		"crops": crops_data
		# Add objects/resources state here
	}

func load_save_data(data):
	crops_data = data.get("crops", {})
	refresh_crops_visuals()
