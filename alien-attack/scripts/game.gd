extends Node2D

# Specify number of player lives
@export var player_lives = 3

# Declare player variable
@onready var player = $player

# Declare score variable
var score = 0

func _on_enemy_deathzone_area_entered(area):
	area.die()

func _on_player_took_damage():
	player_lives -= 1
	if player_lives == 0:
		player.die()

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	# Connect enemy.died() function
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	print("enemy_died")
