extends Area2D
class_name Enemy

@export var data: EnemyData

var is_dead: bool = false

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area.is_in_group("player_hitbox") and not is_dead:
		die()

func die():
	is_dead = true
	EventBus.enemy_died.emit(data.id, data.base_shard_drop)
	
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.play("dead")
	await $AnimatedSprite2D.animation_finished
	queue_free()
