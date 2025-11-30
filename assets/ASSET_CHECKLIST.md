# 🎨 Pixel Art Asset Checklist - Farming Game
**Style**: Studio Ghibli-inspired, Warm & Cozy  
**Size**: 48×48 pixels per tile/sprite  
**Format**: PNG with transparency  
**View**: Top-down 3/4 perspective

---

## ✅ PART 1 — Characters (Sprite Sheets)

### Player Characters
- [ ] **Male Player** - `characters/player_male.png`
  - Grid: 4 columns (down/up/left/right) × 9 rows
  - Row 1: Idle (1 frame per direction)
  - Row 2-5: Walk (4 frames per direction)
  - Row 6-9: Run (4 frames per direction)
  - Size: 192×432 (4×9 tiles)

- [ ] **Female Player** - `characters/player_female.png`
  - Same layout as male player
  - Size: 192×432

- [ ] **Tool Animations** - `characters/player_tools.png`
  - Grid: 4 directions × 4 tools
  - Hoe, Axe, Watering Can, Pickaxe
  - 3 frames per action
  - Size: 192×576

- [ ] **Faint Animation** - `characters/player_faint.png`
  - Lying down sprite (4 frames)
  - Size: 192×48

### NPCs (Town)
- [ ] **Child** - `characters/npc_child.png` (192×192, idle+walk)
- [ ] **Shopkeeper** - `characters/npc_shopkeeper.png`
- [ ] **Blacksmith** - `characters/npc_blacksmith.png`
- [ ] **Farmer** - `characters/npc_farmer.png`
- [ ] **Miner** - `characters/npc_miner.png`
- [ ] **Doctor** - `characters/npc_doctor.png`
- [ ] **Elder** - `characters/npc_elder.png`
- [ ] **Merchant** - `characters/npc_merchant.png`

### Marriageable NPCs (Special Design)
- [ ] **Bachelor 1** - `characters/bachelor_1.png`
- [ ] **Bachelor 2** - `characters/bachelor_2.png`
- [ ] **Bachelorette 1** - `characters/bachelorette_1.png`
- [ ] **Bachelorette 2** - `characters/bachelorette_2.png`

### Festival Outfits (Separate Sheets)
- [ ] **Festival Variants** - `characters/festival_outfits.png`
  - All NPCs in festival clothing
  - Same animation structure

---

## ✅ PART 2 — Animals

### Chicken
- [ ] **Chicken** - `animals/chicken.png`
  - Idle: 1 frame
  - Walk: 4 frames (2 directions)
  - Eating: 3 frames
  - Sleeping: 1 frame
  - Laying egg: 3 frames
  - Size: 240×96 (5×2 grid)

- [ ] **Chick** - `animals/chick.png`
  - Baby version (smaller, 24×24 centered in 48×48)
  - Walk: 4 frames
  - Size: 192×48

### Cow
- [ ] **Cow** - `animals/cow.png`
  - Idle: 1 frame
  - Walk: 4 frames (2 directions)
  - Eating: 3 frames
  - Sleeping: 1 frame
  - Milking pose: 1 frame
  - Size: 240×96

- [ ] **Calf** - `animals/calf.png`
  - Baby version
  - Size: 192×48

### Pets
- [ ] **Cat** - `animals/cat.png`
  - Walk: 4 frames × 4 directions
  - Sit: 1 frame
  - Sleep: 1 frame
  - Run: 4 frames
  - Size: 192×288

- [ ] **Dog** - `animals/dog.png`
  - Same layout as cat
  - Size: 192×288

---

## ✅ PART 3 — Crops (5 Growth Stages Each)

Each crop: 240×48 (5 stages × 48px)

- [ ] **Carrot** - `crops/carrot.png`
- [ ] **Potato** - `crops/potato.png`
- [ ] **Corn** - `crops/corn.png`
- [ ] **Pumpkin** - `crops/pumpkin.png`
- [ ] **Wheat** - `crops/wheat.png`
- [ ] **Tomato** - `crops/tomato.png`
- [ ] **Strawberry** - `crops/strawberry.png`

### Fruit Trees (3 Stages + Fruit)
- [ ] **Apple Tree** - `crops/tree_apple.png` (192×48)
  - Sapling → Young → Mature → With Fruit
- [ ] **Peach Tree** - `crops/tree_peach.png`
- [ ] **Grape Vine** - `crops/vine_grape.png`

---

## ✅ PART 4 — Resources

### Trees (Destruction Stages)
- [ ] **Oak Tree** - `resources/tree_oak.png`
  - Full → Hit 1 → Hit 2 → Stump
  - Size: 192×48 (4 stages)
- [ ] **Pine Tree** - `resources/tree_pine.png`
- [ ] **Birch Tree** - `resources/tree_birch.png`

### Rocks (Breaking Stages)
- [ ] **Small Rock** - `resources/rock_small.png` (96×48, 2 stages)
- [ ] **Medium Rock** - `resources/rock_medium.png` (144×48, 3 stages)
- [ ] **Large Rock** - `resources/rock_large.png` (192×48, 4 stages)

### Ores (2 Breaking Stages)
- [ ] **Copper Ore** - `resources/ore_copper.png` (96×48)
- [ ] **Iron Ore** - `resources/ore_iron.png`
- [ ] **Silver Ore** - `resources/ore_silver.png`
- [ ] **Gold Ore** - `resources/ore_gold.png`

### Foliage
- [ ] **Bush** - `resources/bush.png` (48×48, 3 variants)
- [ ] **Flowers** - `resources/flowers.png` (240×48, 5 types)
- [ ] **Short Grass** - `resources/grass_short.png` (144×48, 3 variants)
- [ ] **Tall Grass** - `resources/grass_tall.png` (144×48, 3 variants)

### Wood Items
- [ ] **Log** - `resources/log.png` (48×48)
- [ ] **Branch** - `resources/branch.png`
- [ ] **Stump** - `resources/stump.png`

---

## ✅ PART 5 — Items (48×48 Icons)

### Seeds
- [ ] **Seed Icons** - `items/seeds.png`
  - All crop seeds in one sheet
  - Size: 336×48 (7 seeds)

### Animal Products
- [ ] **Egg** - `items/egg.png`
- [ ] **Milk** - `items/milk.png`
- [ ] **Wool** - `items/wool.png`

### Fishing & Food
- [ ] **Fish** - `items/fish.png` (240×48, 5 types)
- [ ] **Animal Feed** - `items/feed.png`
- [ ] **Cooked Food** - `items/food.png` (480×48, 10 types)

### Tools
- [ ] **Hoe** - `items/tool_hoe.png`
- [ ] **Axe** - `items/tool_axe.png`
- [ ] **Watering Can** - `items/tool_wateringcan.png`
- [ ] **Pickaxe** - `items/tool_pickaxe.png`
- [ ] **Hammer** - `items/tool_hammer.png`
- [ ] **Fishing Rod** - `items/tool_fishingrod.png`

### Upgrade Materials
- [ ] **Copper Bar** - `items/bar_copper.png`
- [ ] **Iron Bar** - `items/bar_iron.png`
- [ ] **Silver Bar** - `items/bar_silver.png`
- [ ] **Gold Bar** - `items/bar_gold.png`

### Resources
- [ ] **Wood** - `items/wood.png`
- [ ] **Stone** - `items/stone.png`
- [ ] **Coal** - `items/coal.png`

---

## ✅ PART 6 — Buildings (Multi-tile)

### Player House
- [ ] **House Exterior** - `buildings/house_exterior.png`
  - Size: 192×192 (4×4 tiles)
- [ ] **House Interior** - `buildings/house_interior.png`
  - Size: 384×288 (8×6 tiles)

### Farm Buildings
- [ ] **Barn** - `buildings/barn.png` (192×144, 4×3 tiles)
- [ ] **Chicken Coop** - `buildings/coop.png` (144×96, 3×2 tiles)

### Town Buildings
- [ ] **General Store** - `buildings/shop.png` (192×192)
- [ ] **Blacksmith** - `buildings/blacksmith.png` (192×144)
- [ ] **Hospital** - `buildings/hospital.png` (192×192)
- [ ] **NPC Houses** - `buildings/npc_house.png` (144×144, 3 variants)

### Special
- [ ] **Mine Entrance** - `buildings/mine.png` (144×144)
- [ ] **Night Market** - `buildings/night_market.png`
  - With floating lanterns
  - Size: 384×288

---

## ✅ PART 7 — Tilesets (48×48 Grid)

### Ground Tiles
- [ ] **Grass Tileset** - `tilesets/grass.png`
  - 3 variants + edges/corners
  - Size: 240×240 (5×5 autotile)

- [ ] **Dirt Tileset** - `tilesets/dirt.png`
  - 3 variants + edges
  - Size: 240×240

- [ ] **Tilled Soil** - `tilesets/soil_tilled.png`
  - Dry + Wet versions
  - Size: 96×48 (2 tiles)

### Paths
- [ ] **Stone Path** - `tilesets/path_stone.png` (240×240)
- [ ] **Wood Path** - `tilesets/path_wood.png` (240×240)

### Water (Animated 3 Frames)
- [ ] **Pond** - `tilesets/water_pond.png` (240×144, 5×3 autotile × 3 frames)
- [ ] **River** - `tilesets/water_river.png`
- [ ] **Ocean** - `tilesets/water_ocean.png`

### Cave/Mine
- [ ] **Cliff** - `tilesets/cliff.png` (240×240)
- [ ] **Cave Wall** - `tilesets/cave_wall.png` (240×240)
- [ ] **Mine Floor** - `tilesets/mine_floor.png` (240×240)

### Fences & Gates
- [ ] **Wood Fence** - `tilesets/fence_wood.png` (240×48, horizontal/vertical/corners)
- [ ] **Farm Gate** - `tilesets/gate.png` (96×48, open/closed)

### Weather Overlay
- [ ] **Rain Overlay** - `tilesets/rain.png`
  - Animated 4 frames
  - Size: 192×48

---

## ✅ PART 8 — UI Elements

### Inventory
- [ ] **Inventory Slot** - `ui/slot.png` (48×48)
  - Normal, Selected, Disabled states
  - Size: 144×48 (3 states)

### Icons
- [ ] **Energy Icon** - `ui/icon_energy.png` (24×24 centered in 48×48)
- [ ] **Heart Icon** - `ui/icon_heart.png`
- [ ] **Money Icon** - `ui/icon_money.png`
- [ ] **Time Icon** - `ui/icon_time.png`

### Dialog
- [ ] **Dialog Box** - `ui/dialog_box.png`
  - 9-slice compatible
  - Size: 144×144 (3×3 sliceable)

### NPC Portraits
- [ ] **Portrait Set** - `ui/portraits.png`
  - All NPCs (64×64 each)
  - Emotions: Happy, Sad, Angry, Surprised
  - Size: 256×variable (4 emotions × N characters)

---

## ✅ PART 9 — Effects (VFX)

### Weather Effects
- [ ] **Rain Drops** - `effects/rain.png`
  - 4 frame animation
  - Size: 192×48

- [ ] **Lightning Flash** - `effects/lightning.png`
  - 3 frames
  - Size: 144×48

### Impact Effects
- [ ] **Ore Sparkle** - `effects/sparkle_ore.png`
  - 5 frames
  - Size: 240×48

- [ ] **Hit Effect** - `effects/hit.png`
  - Wood/Stone variants
  - 3 frames each
  - Size: 144×96

- [ ] **Collect Sparkle** - `effects/sparkle_collect.png`
  - 4 frames
  - Size: 192×48

### Lighting
- [ ] **Night Glow** - `effects/glow_night.png`
  - Soft radial gradient
  - Size: 96×96

---

## ✅ PART 10 — Weather Layers (Overlays)

All transparent PNG overlays:

- [ ] **Sunny** - `weather/sunny.png` (1280×720, warm tint)
- [ ] **Cloudy** - `weather/cloudy.png` (1280×720, gray tint)
- [ ] **Morning Fog** - `weather/fog.png` (1280×720, Ghibli-style)
- [ ] **Light Rain** - `weather/rain_light.png` (animated)
- [ ] **Heavy Rain** - `weather/rain_heavy.png` (animated)
- [ ] **Thunderstorm** - `weather/storm.png` (animated)
- [ ] **Snow** - `weather/snow.png`
  - Falling snowflakes (3 frame loop)
  - Size: 1280×720

---

## ✅ PART 11 — Festival Decorations

- [ ] **Japanese Lanterns** - `festival/lanterns.png`
  - Hanging, glowing
  - 3 variants
  - Size: 144×48

- [ ] **Flags** - `festival/flags.png`
  - Ghibli-style bunting
  - 4 colors
  - Size: 192×48

- [ ] **Small Statues** - `festival/statues.png`
  - Cute decorative items
  - Size: 144×48 (3 types)

- [ ] **Festival Stage** - `festival/stage.png`
  - Town center platform
  - Size: 192×144

---

## 📊 Summary Statistics

**Total Assets**: ~120 files  
**Estimated Total Sprites**: 800+ individual frames  
**Total File Size**: ~15-25 MB (optimized PNG)

---

## 🎨 Color Palette Guidelines (Ghibli-Inspired)

### Grass & Nature
- Light Green: `#9CCC65`
- Medium Green: `#66BB6A`
- Dark Green: `#388E3C`

### Soil & Earth
- Light Brown: `#A1887F`
- Medium Brown: `#795548`
- Dark Brown: `#5D4037`

### Sky & Water
- Sky Blue: `#81D4FA`
- Water Blue: `#4FC3F7`
- Deep Water: `#0288D1`

### Warm Accents
- Sunset Orange: `#FFB74D`
- Warm Yellow: `#FFF176`
- Soft Pink: `#F48FB1`

### UI & Text
- Light Cream: `#FFF9C4`
- Dark Text: `#3E2723`
- UI Border: `#8D6E63`

---

## 📝 Notes for Artists

1. **Consistency**: Keep line thickness consistent (1-2px)
2. **Dithering**: Use minimal dithering for smooth gradients
3. **Outlines**: Use dark outlines but not pure black
4. **Shadows**: Soft shadows with 50% opacity
5. **Animation**: Smooth transitions between frames
6. **Grid Alignment**: All sprites must align to 48×48 grid
7. **Transparency**: Clean alpha edges, no semi-transparent halos
8. **Naming**: Use lowercase, underscores, descriptive names

---

## ✅ Priority Order

### Phase 1 (MVP - Week 1)
1. Player character (male)
2. Basic tileset (grass, dirt, tilled soil)
3. Tools (hoe, axe, watering can, pickaxe)
4. Crops (corn, potato, carrot - 5 stages each)
5. Tree and rock (with destruction)
6. Basic UI (inventory slots, icons)

### Phase 2 (Core Features - Week 2)
1. Female player
2. NPCs (8 town characters)
3. Animals (chicken, cow)
4. Buildings (house, barn, coop)
5. More crops and items
6. Effects (hit, sparkle)

### Phase 3 (Polish - Week 3)
1. Marriageable NPCs
2. Festival decorations
3. Weather overlays
4. Advanced animations
5. NPC portraits
6. Additional buildings

---

**Last Updated**: 2025-11-30  
**For**: Godot 4 Farming Game Project
