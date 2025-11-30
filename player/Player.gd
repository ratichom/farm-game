extends CharacterBody2D

signal energy_changed(current, max)

@export var speed: float = 100.0
@export var interact_radius: float = 50.0
@export var max_energy: float = 100.0

var current_energy: float = 100.0
var facing_direction = Vector2.DOWN
var is_using_tool: bool = false

@onready var animation_player = $AnimationPlayer
@onready var raycast = $RayCast2D

func _ready():
	add_to_group("player")
	TimeManager.connect("new_day", _on_new_day)
	current_energy = max_energy
	emit_signal("energy_changed", current_energy, max_energy)

func _physics_process(_delta):
	if is_using_tool:
		return
		
	handle_movement()
	handle_interaction()

func handle_movement():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	
	if input_dir != Vector2.ZERO:
		facing_direction = input_dir
		update_animation("walk")
		raycast.target_position = facing_direction * 32
	else:
		update_animation("idle")
	
	move_and_slide()

func update_animation(anim_type: String):
	# Placeholder for animation logic
	# $AnimatedSprite2D.play(anim_type + "_" + get_direction_string())
	pass

func handle_interaction():
	# Scroll inventory
	if Input.is_action_just_pressed("next_slot"):
		Inventory.set_active_slot((Inventory.active_slot_index + 1) % Inventory.slot_count)
	if Input.is_action_just_pressed("prev_slot"):
		Inventory.set_active_slot((Inventory.active_slot_index - 1 + Inventory.slot_count) % Inventory.slot_count)
	
	# Use Tool / Interact
	if Input.is_action_just_pressed("use_tool"):
		use_current_item()

func use_current_item():
	if current_energy <= 0:
		print("No energy!")
		return

	var item = Inventory.get_selected_item()
	if not item:
		# Empty hand interaction
		interact_with_object()
		return
		
	var item_def = Global.item_data.get(item.id)
	if not item_def: return

	# Get target position
	var target_pos = global_position + (facing_direction * 16)
	
	# Check distance
	if global_position.distance_to(target_pos) > interact_radius:
		return

	var world = get_tree().get_first_node_in_group("world")
	if not world: return

	var energy_cost = 0
	var success = false

	match item_def.type:
		Global.ItemType.TOOL:
			success = world.on_player_use_tool(target_pos, item_def.tool_type)
			energy_cost = 2
		Global.ItemType.SEED:
			success = world.on_player_plant_seed(target_pos, item_def.crop_id)
			if success:
				Inventory.remove_item(Inventory.active_slot_index, 1)
				energy_cost = 1
		Global.ItemType.CONSUMABLE:
			consume_item(item_def)
			Inventory.remove_item(Inventory.active_slot_index, 1)
		Global.ItemType.RESOURCE:
			# Place object?
			pass

	if success and energy_cost > 0:
		consume_energy(energy_cost)
		play_tool_animation()

func interact_with_object():
	# Check RayCast or Area2D
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("interact"):
			collider.interact()

func consume_item(item_def):
	if item_def.get("energy_restore"):
		current_energy = min(current_energy + item_def.energy_restore, max_energy)
		emit_signal("energy_changed", current_energy, max_energy)
		print("Restored energy: ", item_def.energy_restore)

func consume_energy(amount):
	current_energy -= amount
	emit_signal("energy_changed", current_energy, max_energy)
	if current_energy <= 0:
		print("Passed out!")
		# Faint logic here

func play_tool_animation():
	is_using_tool = true
	# Play animation
	await get_tree().create_timer(0.3).timeout
	is_using_tool = false

func _on_new_day():
	current_energy = max_energy
	emit_signal("energy_changed", current_energy, max_energy)
	global_position = Vector2(100, 100) # Reset to bed position (placeholder)

func collect_item(item_id: String, amount: int):
	Inventory.add_item(item_id, amount)
