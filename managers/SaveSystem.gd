extends Node

const SAVE_PATH = "user://savegame.json"

func save_game():
	var save_data = {
		"time": {
			"minute": TimeManager.current_minute,
			"hour": TimeManager.current_hour,
			"day": TimeManager.current_day,
			"season": TimeManager.current_season,
			"year": TimeManager.current_year
		},
		"inventory": Inventory.slots,
		"player": get_player_data(),
		"world": get_world_data()
	}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		print("Game Saved")
	else:
		print("Failed to save game")

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		print("No save file found")
		return
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	var save_data = JSON.parse_string(content)
	
	if save_data:
		# Restore Time
		var time = save_data.get("time", {})
		TimeManager.current_minute = time.get("minute", 0)
		TimeManager.current_hour = time.get("hour", 6)
		TimeManager.current_day = time.get("day", 1)
		TimeManager.current_season = time.get("season", 0)
		TimeManager.current_year = time.get("year", 1)
		
		# Restore Inventory
		Inventory.slots = save_data.get("inventory", [])
		Inventory.emit_signal("inventory_updated")
		
		# Restore Player
		restore_player_data(save_data.get("player", {}))
		
		# Restore World
		restore_world_data(save_data.get("world", {}))
		
		print("Game Loaded")

func get_player_data():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		return {
			"position_x": player.global_position.x,
			"position_y": player.global_position.y,
			"energy": player.current_energy
		}
	return {}

func restore_player_data(data):
	var player = get_tree().get_first_node_in_group("player")
	if player and data:
		player.global_position = Vector2(data.get("position_x", 0), data.get("position_y", 0))
		player.current_energy = data.get("energy", 100)

func get_world_data():
	# This requires World to expose its state
	var world = get_tree().get_first_node_in_group("world")
	if world and world.has_method("get_save_data"):
		return world.get_save_data()
	return {}

func restore_world_data(data):
	var world = get_tree().get_first_node_in_group("world")
	if world and world.has_method("load_save_data"):
		world.load_save_data(data)
