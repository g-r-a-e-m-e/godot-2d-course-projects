extends Node2D

# Send signal to game scene
signal enemy_spawned(enemy_instance)

# Get Timer node
@onready var timer_node = $Timer

# Preload enemy scene and get spawn_position node
var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_container = $spawn_container

func _ready():
	timer_node.connect("timeout", _on_timeout)

func _on_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_position_array = spawn_container.get_children()
	var random_spawn_position = spawn_position_array.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	#add_child(enemy_instance)
	emit_signal("enemy_spawned", enemy_instance)
