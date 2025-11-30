# Implementation Plan - Full Farming Game

## Goal
Expand the prototype into a playable farming game with Day/Night cycle, Save/Load, and advanced interactions.

## 1. Project Restructuring
Move files to:
- `res://player/`
- `res://world/`
- `res://managers/`
- `res://ui/`
- `res://items/`
- `res://crops/`
- `res://resources/`
- `res://animals/`
- `res://npcs/`

## 2. Core Systems (Managers)

### `TimeManager.gd` (Autoload)
- Signals: `minute_passed`, `hour_passed`, `day_started`, `new_day`
- Variables: `minute`, `hour`, `day`, `season`, `year`
- Logic: `advance_time()`, `sleep()`

### `SaveSystem.gd` (Autoload)
- `save_game()`: Collects data from Managers and World.
- `load_game()`: Distributes data to Managers and World.
- Data structure: `{"player": {...}, "world": {...}, "time": {...}, "inventory": [...]}`

### `Inventory.gd` (Autoload)
- Manage items array.
- Helper functions for UI.

## 3. Player
- **Energy**: `current_energy`, `max_energy`.
- **Tools**: Check `Global.ItemType` to determine action.
- **Interaction**: `Area2D` to detect `Interactable` nodes (NPCs, Animals).

## 4. World & Farming
- **TileMap**:
    - Layer 0: Ground
    - Layer 1: Soil (Source ID 1: 0=Dry, 1=Wet)
- **Crops**:
    - Dictionary `crops_data` in `World.gd` to track crop state at cell positions.
    - `Crop` nodes instantiated only when visible or just data-driven? -> **Hybrid**: `Crop` nodes for visuals, data for saving.

## 5. UI
- **HUD**: Connects to `TimeManager` and `Player` signals.
- **InventoryUI**: Grid of slots.

## 6. Advanced Scaffolding
- **Animals**: `Animal` class with `feed()`, `pet()`.
- **NPCs**: `NPC` class with `interact()`.

## Verification Plan
- **Manual Test**:
    - Run `World.tscn`.
    - Check Time passing.
    - Check Energy depletion.
    - Check Save/Load (restart game).
