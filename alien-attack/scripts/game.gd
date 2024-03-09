extends Node2D

# Specify number of player lives
@export var player_lives = 3

# Declare player variable
@onready var player = $player

# Declare ui variables
@onready var ui = $ui
@onready var hud = $ui/hud

# Preload game_over_screen
var game_over_screen_scene = preload("res://scenes/game_over_screen.tscn")

# Declare score variable
var score = 0

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(player_lives)

func _on_enemy_deathzone_area_entered(area):
	area.die()

func _on_player_took_damage():
	player_lives -= 1
	hud.set_lives_label(player_lives)
	if player_lives == 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_screen = game_over_screen_scene.instantiate()
		ui.add_child(game_over_screen)
		game_over_screen.set_final_score_label(score)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	# Connect enemy.died() function
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 10
	hud.set_score_label(score)
