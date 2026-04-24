extends Node2D
class_name EnemySystem

@export var enemy_scene: PackedScene
@export var pool_size: int = 15 # Ekranda aynı anda en fazla kaç düşman olabilir?
@export var spawn_interval: float = 1.0 

var enemy_pool: Array[Enemy] = []
var spawn_timer: Timer

func _ready():
	_initialize_pool()
	_setup_timer()

func _initialize_pool():
	for i in range(pool_size):
		var enemy_instance = enemy_scene.instantiate() as Enemy
		add_child(enemy_instance)
		enemy_instance.hide() # Başlangıçta hepsi görünmez
		enemy_instance.returned_to_pool.connect(_on_enemy_returned)
		enemy_pool.append(enemy_instance)

func _setup_timer():
	spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_spawn_enemy)
	add_child(spawn_timer)

func _spawn_enemy():
	var enemy = _get_available_enemy()
	if enemy:
		# Oyuncunun ilerisine, sağ tarafa bir yere doğuruyoruz. (X koordinatını kendi oyununa göre ayarla)
		var spawn_pos = Vector2(1200, randf_range(300, 500)) 
		enemy.revive(spawn_pos)

func _get_available_enemy() -> Enemy:
	for enemy in enemy_pool:
		if enemy.is_dead and not enemy.visible:
			return enemy
	return null # Eğer tüm düşmanlar sahnede aktifse, yenisini doğurmaz.

func _on_enemy_returned(_enemy_node):
	# Düşman öldü ve havuza döndü. Şimdilik ekstra bir işlem gerekmiyor.
	pass
