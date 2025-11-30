# Godot Farming Game Setup Guide

## 1. Project Settings
- **Input Map**: Go to Project > Project Settings > Input Map and add:
  - `move_left`, `move_right`, `move_up`, `move_down` (Arrow keys or WASD)
  - `use_tool` (Space or Mouse Left Click)
  - `next_slot` (E or Mouse Wheel Up)
  - `prev_slot` (Q or Mouse Wheel Down)

## 2. Scene Setup

### Player.tscn
- `CharacterBody2D` (Script: `res://scripts/entities/Player.gd`)
  - `CollisionShape2D` (Capsule)
  - `Sprite2D` or `AnimatedSprite2D` (Player graphics)
  - `RayCast2D` (Name: "RayCast2D", Enabled: On, Target Position: (0, 32))
  - `Node` (Name: "Inventory", Script: `res://scripts/components/Inventory.gd`)

### World.tscn
- `Node2D` (Script: `res://scripts/world/World.gd`)
  - `TileMap` (Name: "TileMap")
    - **Layers**:
      - Layer 0: "Ground" (Grass)
      - Layer 1: "Soil" (Dirt)
    - **TileSet**:
      - Create a TileSet with Source ID 1 for Soil.
      - Coord (0,0) = Dry Soil
      - Coord (0,1) = Wet Soil
  - `Node2D` (Name: "Crops")
  - `Node2D` (Name: "Objects") (Put Trees/Rocks here)
  - `CanvasLayer` (UI)
    - `Control` (Script: `res://scripts/ui/InventoryUI.gd`)
      - `GridContainer`
        - `Panel` (Slot 1) -> `TextureRect` (Icon), `Label` (Amount)
        - ... (Duplicate for 12 slots)
  - `CharacterBody2D` (Instance `Player.tscn`)

### ResourceObject.tscn (Tree/Rock)
- `Node2D` (Script: `res://scripts/world/ResourceObject.gd`)
  - `Sprite2D` (Tree/Rock image)
  - `Area2D`
    - `CollisionShape2D` (Circle/Rectangle covering the base)
    - **Collision Layer**: Set to a layer the Player's RayCast can detect.

### Crop.tscn
- `Node2D` (Script: `res://scripts/world/Crop.gd`)
  - `Sprite2D` (Crop image, set Hframes for stages)

## 3. Testing
1. Open `World.tscn`.
2. Draw some grass on Layer 0.
3. Place a Tree (Instance `ResourceObject.tscn`) in the "Objects" node.
4. Run the scene.
5. Walk with WASD.
6. Press `E` to switch to Axe.
7. Face the tree and press `Space` (or your use_tool key).
8. Tree should flash and eventually disappear (dropping wood logic).
9. Switch to Hoe, face empty ground, press `Space`. Ground should turn to Soil.
10. Switch to Corn Seed, face Soil, press `Space`. Crop should appear.
11. Switch to Watering Can, face Crop, press `Space`. Soil should turn wet.

## 4. Scripts Location
- `scripts/autoload/Global.gd` -> **Add to Autoloads** in Project Settings as "Global".
- `scripts/components/Inventory.gd`
- `scripts/entities/Player.gd`
- `scripts/world/World.gd`
- `scripts/world/ResourceObject.gd`
- `scripts/world/Crop.gd`
- `scripts/ui/InventoryUI.gd`
