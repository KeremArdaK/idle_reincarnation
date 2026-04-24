extends Area2D
class_name Enemy

@export var data: EnemyData

# Havuza geri döndüğümüzü Spawner'a haber vermek için
signal returned_to_pool(enemy_node)

var is_dead: bool = true # Başlangıçta ölü (havuzda bekliyor) kabul edelim

func _ready():
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
	
	# SİLMEK YERİNE GİZLİYORUZ
	hide() 
	returned_to_pool.emit(self)

# Düşmanı sahneye tekrar çağıran fonksiyon
func revive(spawn_position: Vector2):
	global_position = spawn_position
	is_dead = false
	$CollisionShape2D.set_deferred("disabled", false)
	show()
	$AnimatedSprite2D.play("idle")
