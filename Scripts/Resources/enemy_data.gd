class_name EnemyData
extends Resource

@export var id: String
@export var display_name: String
@export var base_shard_drop: int = 1

@export var sprite: Texture2D 

# Düşmanın Kırılma öncesindeki haline dair ufak bir metin. 
@export_multiline var lore_fragment: String
