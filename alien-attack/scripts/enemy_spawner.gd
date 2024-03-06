extends Node2D

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
	# Instance enemy
	var enemy_instance = enemy_scene.instantiate()
	
	# Randomize position_index and get corresponding spawn_position
	var position_index = "spawn_position_{idx}".format({"idx": "%0*d" % [2, randi_range(1, 11)]})
	var spawn_position = spawn_container.get_node(position_index)
	
	# Add child at randomized spawn_position
	spawn_position.add_child(enemy_instance)
