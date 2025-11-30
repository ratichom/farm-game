# 🎨 Asset Template Guide - Godot 4 Import Settings

This file contains the recommended import settings for each asset type in Godot 4.

## 📋 General Import Settings

All pixel art assets should use these base settings:

```
Texture:
  - Compress: Lossless
  - Filter: Nearest (for crisp pixels)
  - Mipmaps: Disabled
  - Repeat: Disabled (unless tiling)
```

---

## 🎭 Character Sprites

**File**: `characters/player_male.png` (192×432)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Nearest
  - Mipmaps: Disabled

AnimatedSprite2D / Sprite2D:
  - Hframes: 4
  - Vframes: 9
  - Frame: 0
```

### Animation Setup (AnimationPlayer)
```gdscript
# In AnimationPlayer
"idle_down": frames 0
"idle_up": frames 1
"idle_left": frames 2
"idle_right": frames 3

"walk_down": frames 4-7 (loop)
"walk_up": frames 8-11 (loop)
"walk_left": frames 12-15 (loop)
"walk_right": frames 16-19 (loop)

"run_down": frames 20-23 (loop)
# etc...
```

---

## 🌾 Crop Sprites

**File**: `crops/corn.png` (240×48)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Nearest

Sprite2D:
  - Hframes: 5
  - Vframes: 1
  - Frame: 0 (will be set by script)
```

### Usage in Crop.gd
```gdscript
@onready var sprite = $Sprite2D

func update_visuals():
    sprite.frame = current_stage  # 0-4
```

---

## 🗺️ Tileset Configuration

**File**: `tilesets/grass.png` (240×240)

### TileSet Setup in Godot
1. Create new TileSet resource
2. Add Atlas Source
3. Set Texture: `grass.png`
4. Set Tile Size: 48×48
5. Enable Autotile (if using 5×5 autotile pattern)

### Autotile Template (5×5)
```
[TL] [T]  [TR] [TL] [TR]
[L]  [C]  [R]  [L]  [R]
[BL] [B]  [BR] [BL] [BR]
[TL] [T]  [TR] [C]  [C]
[L]  [B]  [R]  [C]  [C]

TL = Top-Left corner
T  = Top edge
TR = Top-Right corner
L  = Left edge
C  = Center
R  = Right edge
BL = Bottom-Left corner
B  = Bottom edge
BR = Bottom-Right corner
```

---

## 🐔 Animal Sprites

**File**: `animals/chicken.png` (240×96)

### Import Settings
```
Sprite2D:
  - Hframes: 5
  - Vframes: 2
```

### Frame Layout
```
Row 0: [Idle] [Walk1] [Walk2] [Walk3] [Walk4]
Row 1: [Eat1] [Eat2] [Eat3] [Sleep] [LayEgg]
```

---

## 🎒 Item Icons

**File**: `items/tool_hoe.png` (48×48)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Nearest
  - Mipmaps: Disabled
```

### Usage in Inventory UI
```gdscript
var icon_texture = load("res://assets/items/tool_hoe.png")
$Icon.texture = icon_texture
```

---

## 🏠 Building Multi-Tiles

**File**: `buildings/house_exterior.png` (192×192)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Nearest
  - Repeat: Disabled
```

### TileMap Usage
1. Add as Atlas Source to TileSet
2. Set Tile Size: 48×48
3. Building will occupy 4×4 tiles
4. Set collision shapes for walls/doors

---

## 💧 Animated Water

**File**: `tilesets/water_pond.png` (240×432)

### Structure
- 3 animation frames vertically
- Each frame: 240×144 (5×3 autotile)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Nearest
```

### TileSet Animation
1. Create 3 separate Atlas Sources (one per frame)
2. Or use AnimatedTexture with 3 frames
3. Set FPS: 4-6 for gentle water movement

---

## ✨ Effect Sprites

**File**: `effects/sparkle_collect.png` (192×48)

### Import Settings
```
Sprite2D:
  - Hframes: 4
  - Vframes: 1
```

### Usage
```gdscript
# In effect script
@onready var sprite = $Sprite2D
var frame = 0

func _process(delta):
    frame += delta * 10  # 10 FPS
    sprite.frame = int(frame) % 4
    if frame >= 4:
        queue_free()  # Remove after animation
```

---

## 🌧️ Weather Overlays

**File**: `weather/rain_light.png` (1280×720)

### Import Settings
```
Texture:
  - Compress: Lossless
  - Filter: Linear (for smooth overlay)
  - Mipmaps: Disabled
```

### Usage
```gdscript
# CanvasLayer with TextureRect
$WeatherOverlay.texture = load("res://assets/weather/rain_light.png")
$WeatherOverlay.modulate.a = 0.3  # 30% opacity
```

---

## 🎨 UI Elements

**File**: `ui/dialog_box.png` (144×144)

### 9-Slice Setup
```
NinePatchRect:
  - Texture: dialog_box.png
  - Patch Margin Left: 48
  - Patch Margin Top: 48
  - Patch Margin Right: 48
  - Patch Margin Bottom: 48
  - Axis Stretch Mode: Tile
```

---

## 📦 Batch Import Script

Save as `import_settings.gd` and run in Godot:

```gdscript
@tool
extends EditorScript

func _run():
    # Set all character sprites
    set_import_settings("res://assets/characters/", {
        "compress/mode": 0,  # Lossless
        "filter": false,     # Nearest
        "mipmaps/generate": false
    })
    
    # Set all tilesets
    set_import_settings("res://assets/tilesets/", {
        "compress/mode": 0,
        "filter": false,
        "mipmaps/generate": false
    })
    
    print("Import settings applied!")

func set_import_settings(path: String, settings: Dictionary):
    var dir = DirAccess.open(path)
    if dir:
        dir.list_dir_begin()
        var file_name = dir.get_next()
        while file_name != "":
            if file_name.ends_with(".png"):
                var full_path = path + file_name
                # Apply settings via ResourceImporter
                # (Implementation depends on Godot version)
            file_name = dir.get_next()
```

---

## 🎯 Quick Reference Table

| Asset Type | Size | Hframes | Vframes | Filter | Compress |
|------------|------|---------|---------|--------|----------|
| Player | 192×432 | 4 | 9 | Nearest | Lossless |
| NPC | 192×192 | 4 | 4 | Nearest | Lossless |
| Crop | 240×48 | 5 | 1 | Nearest | Lossless |
| Animal | 240×96 | 5 | 2 | Nearest | Lossless |
| Item Icon | 48×48 | 1 | 1 | Nearest | Lossless |
| Tileset | 240×240 | 5 | 5 | Nearest | Lossless |
| Building | varies | varies | varies | Nearest | Lossless |
| Effect | varies | varies | 1 | Nearest | Lossless |
| Weather | 1280×720 | 1 | 1 | Linear | Lossless |
| UI | varies | varies | varies | Nearest | Lossless |

---

## 🔧 Common Issues & Fixes

### Blurry Sprites
**Problem**: Sprites look blurry in-game  
**Fix**: Set Filter to "Nearest" in import settings

### Seams in Tilemap
**Problem**: Visible lines between tiles  
**Fix**: 
1. Ensure tiles are exactly 48×48
2. Disable mipmaps
3. Use Nearest filter
4. Check for semi-transparent pixels at edges

### Animation Stuttering
**Problem**: Character animations look choppy  
**Fix**:
1. Use consistent frame timing (0.1s per frame = 10 FPS)
2. Ensure all frames are same size
3. Check AnimationPlayer FPS settings

### Transparent Halos
**Problem**: White/colored edges around sprites  
**Fix**:
1. Use proper alpha channel (not color key)
2. Clean up semi-transparent pixels
3. Export with "Premultiplied Alpha" disabled

---

**Last Updated**: 2025-11-30  
**Godot Version**: 4.5+
