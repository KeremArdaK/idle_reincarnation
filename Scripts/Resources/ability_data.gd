class_name AbilityData
extends Resource

enum Rarity { COMMON, UNCOMMON, RARE, EPIC, LEGENDARY, MYTHIC}

@export var id: String
@export var display_name: String
@export_multiline var description: String
@export_multiline var lore_text: String
@export var rarity: Rarity = Rarity.COMMON
@export var icon: Texture2D
@export var dps_multiplier: float = 1.05
@export var passive_bonus: Dictionary = {}
