extends Node

# --SAVAŞ SİNYALLERİ--
signal enemy_died(enemy_id: String, shard_amount: int)
signal enemy_spawned(enemy_data: EnemyData)

# --EKONOMİ VE GACHA SİNYALLERİ--
signal shard_collected(amount: int)
signal ability_rolled(ability: AbilityData)
signal pity_updated(current_rolls: int, rolls_to_legendary: int)

# --OYUN DÖNGÜSÜ SİNYALLERİ--
signal game_saved
signal prestige_triggered(prestige_points_gained: int)
