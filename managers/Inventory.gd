extends Node

signal inventory_updated
signal active_slot_changed(index)

var slot_count: int = 12
var slots: Array = []
var active_slot_index: int = 0

func _ready():
	# Initialize empty slots
	slots.resize(slot_count)
	for i in range(slot_count):
		slots[i] = null
	
	# Debug: Add starting items
	add_item("hoe", 1)
	add_item("axe", 1)
	add_item("pickaxe", 1)
	add_item("watering_can", 1)
	add_item("corn_seed", 5)
	add_item("potato_seed", 5)

func add_item(item_id: String, amount: int) -> int:
	var item_def = Global.item_data.get(item_id)
	if not item_def:
		return amount # Failed to add
	
	# 1. Try to stack with existing items
	if item_def.get("stackable", false):
		for i in range(slot_count):
			if slots[i] and slots[i].id == item_id:
				var space = item_def.max_stack - slots[i].amount
				var to_add = min(amount, space)
				slots[i].amount += to_add
				amount -= to_add
				if amount == 0:
					emit_signal("inventory_updated")
					return 0
	
	# 2. Add to first empty slot
	for i in range(slot_count):
		if slots[i] == null:
			if amount > 0:
				var to_add = amount
				if item_def.get("stackable", false):
					to_add = min(amount, item_def.max_stack)
				
				slots[i] = {
					"id": item_id,
					"amount": to_add
				}
				amount -= to_add
				if amount == 0:
					emit_signal("inventory_updated")
					return 0
	
	emit_signal("inventory_updated")
	return amount # Return remaining amount that couldn't be added

func remove_item(index: int, amount: int) -> bool:
	if index < 0 or index >= slot_count or slots[index] == null:
		return false
	
	if slots[index].amount >= amount:
		slots[index].amount -= amount
		if slots[index].amount <= 0:
			slots[index] = null
		emit_signal("inventory_updated")
		return true
	return false

func swap_items(index_a: int, index_b: int):
	if index_a < 0 or index_a >= slot_count or index_b < 0 or index_b >= slot_count:
		return
	
	var temp = slots[index_a]
	slots[index_a] = slots[index_b]
	slots[index_b] = temp
	emit_signal("inventory_updated")

func set_active_slot(index: int):
	if index >= 0 and index < slot_count:
		active_slot_index = index
		emit_signal("active_slot_changed", index)

func get_selected_item():
	if active_slot_index >= 0 and active_slot_index < slot_count:
		return slots[active_slot_index]
	return null
