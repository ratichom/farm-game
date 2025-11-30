extends Node

# Global.gd
# Autoload name: Global

enum ItemType {
	TOOL,
	SEED,
	CROP,
	RESOURCE,
	CONSUMABLE,
	FURNITURE
}

enum ToolType {
	NONE,
	HAND,
	HOE,
	AXE,
	PICKAXE,
	WATERING_CAN
}

# Item Database
var item_data = {
	"wood": {
		"name": "Wood",
		"type": ItemType.RESOURCE,
		"stackable": true,
		"max_stack": 99,
		"texture_path": "res://assets/items/wood.png",
		"description": "A sturdy piece of wood."
	},
	"stone": {
		"name": "Stone",
		"type": ItemType.RESOURCE,
		"stackable": true,
		"max_stack": 99,
		"texture_path": "res://assets/items/stone.png",
		"description": "A heavy stone."
	},
	"corn_seed": {
		"name": "Corn Seed",
		"type": ItemType.SEED,
		"crop_id": "corn",
		"stackable": true,
		"max_stack": 99,
		"texture_path": "res://assets/items/corn_seed.png",
		"price": 10
	},
	"corn": {
		"name": "Corn",
		"type": ItemType.CROP,
		"stackable": true,
		"max_stack": 99,
		"sell_price": 50,
		"texture_path": "res://assets/items/corn.png",
		"edible": true,
		"energy_restore": 20
	},
	"potato_seed": {
		"name": "Potato Seed",
		"type": ItemType.SEED,
		"crop_id": "potato",
		"stackable": true,
		"max_stack": 99,
		"texture_path": "res://assets/items/potato_seed.png",
		"price": 20
	},
	"potato": {
		"name": "Potato",
		"type": ItemType.CROP,
		"stackable": true,
		"max_stack": 99,
		"sell_price": 80,
		"texture_path": "res://assets/items/potato.png",
		"edible": true,
		"energy_restore": 30
	},
	"hoe": {
		"name": "Hoe",
		"type": ItemType.TOOL,
		"tool_type": ToolType.HOE,
		"stackable": false,
		"texture_path": "res://assets/items/hoe.png"
	},
	"axe": {
		"name": "Axe",
		"type": ItemType.TOOL,
		"tool_type": ToolType.AXE,
		"stackable": false,
		"texture_path": "res://assets/items/axe.png"
	},
	"pickaxe": {
		"name": "Pickaxe",
		"type": ItemType.TOOL,
		"tool_type": ToolType.PICKAXE,
		"stackable": false,
		"texture_path": "res://assets/items/pickaxe.png"
	},
	"watering_can": {
		"name": "Watering Can",
		"type": ItemType.TOOL,
		"tool_type": ToolType.WATERING_CAN,
		"stackable": false,
		"texture_path": "res://assets/items/watering_can.png"
	}
}
