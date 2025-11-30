extends Control

@onready var grid_container = $GridContainer

var slots_ui: Array = []

func _ready():
	Inventory.connect("inventory_updated", update_ui)
	Inventory.connect("active_slot_changed", on_active_slot_changed)
	
	# Initialize UI slots
	slots_ui = grid_container.get_children()
	update_ui()
	on_active_slot_changed(Inventory.active_slot_index)

func update_ui():
	for i in range(min(slots_ui.size(), Inventory.slots.size())):
		var slot_data = Inventory.slots[i]
		var slot_node = slots_ui[i]
		
		# Assuming slot_node has 'Icon' (TextureRect) and 'Amount' (Label) children
		var icon_node = slot_node.get_node_or_null("Icon")
		var amount_node = slot_node.get_node_or_null("Amount")
		
		if not icon_node or not amount_node:
			continue
		
		if slot_data:
			var item_def = Global.item_data.get(slot_data.id)
			if item_def:
				# Try to load texture, fallback to icon
				var texture_path = item_def.get("texture_path", "res://icon.svg")
				if ResourceLoader.exists(texture_path):
					icon_node.texture = load(texture_path)
				else:
					icon_node.texture = load("res://icon.svg")
				icon_node.visible = true
				
				if slot_data.amount > 1:
					amount_node.text = str(slot_data.amount)
					amount_node.visible = true
				else:
					amount_node.visible = false
		else:
			icon_node.visible = false
			amount_node.visible = false

func on_active_slot_changed(index: int):
	for i in range(slots_ui.size()):
		var slot_node = slots_ui[i]
		# Highlight active slot
		if i == index:
			slot_node.modulate = Color(1, 1, 0) # Yellow highlight
		else:
			slot_node.modulate = Color(1, 1, 1)
