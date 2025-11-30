extends CanvasLayer

@onready var time_label = $Panel/VBoxContainer/TimeLabel
@onready var date_label = $Panel/VBoxContainer/DateLabel
@onready var energy_bar = $Panel/VBoxContainer/EnergyBar

func _ready():
	TimeManager.connect("minute_passed", _on_time_update)
	TimeManager.connect("day_started", _on_day_update)
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.connect("energy_changed", _on_energy_changed)
	
	update_display()

func _on_time_update(_total_minutes):
	update_display()

func _on_day_update(_day):
	update_display()

func _on_energy_changed(current, maximum):
	if energy_bar:
		energy_bar.max_value = maximum
		energy_bar.value = current

func update_display():
	if time_label:
		time_label.text = TimeManager.get_time_string()
	if date_label:
		date_label.text = TimeManager.get_date_string()
