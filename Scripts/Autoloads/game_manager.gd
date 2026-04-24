extends Node

var total_shards: int = 0

func _ready():
	# EventBus'taki sinyalleri dinlemeye başlıyoruz
	EventBus.enemy_died.connect(_on_enemy_died)

func _on_enemy_died(enemy_id: String, shard_amount: int):
	# İleride burada yeteneklerden gelen (AbilityData.dps_multiplier vs.) 
	# shard artış çarpanlarını da hesaplayacağız.
	total_shards += shard_amount
	EventBus.shard_collected.emit(total_shards)
	print("Düşman parçalandı! Kazanılan Shard: ", shard_amount, " | Toplam: ", total_shards)
