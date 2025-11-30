extends Node2D

@export var item_id_to_drop: String = "wood"
@export var min_tool_amount: int = 1
@export var required_tool_type: Global.ToolType = Global.ToolType.AXE
@export var health: int = 3

@onready var sprite = $Sprite2D

func interact(tool_type: int):
	if tool_type != required_tool_type:
		return
	
	take_damage(1)

func take_damage(amount: int):
	health -= amount
	create_hit_effect()
	
	if health <= 0:
		destroy()

func create_hit_effect():
	if sprite:
		sprite.modulate = Color(1, 0, 0)
		await get_tree().create_timer(0.1).timeout
		sprite.modulate = Color(1, 1, 1)

func destroy():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.collect_item(item_id_to_drop, min_tool_amount)
	queue_free()
