extends Node2D

var crop_id: String
var current_stage: int = 0

@onready var sprite = $Sprite2D

func init(id: String, stage: int):
	crop_id = id
	current_stage = stage
	update_visuals()

func update_visuals():
	if not sprite: return
	
	# In a real game, load texture based on ID and frame based on stage
	# var texture = load("res://assets/crops/" + crop_id + ".png")
	# sprite.texture = texture
	# sprite.hframes = 4
	sprite.frame = current_stage
	
	# Placeholder color change for stage
	var color_val = 0.5 + (current_stage * 0.15)
	sprite.modulate = Color(color_val, color_val, color_val)
