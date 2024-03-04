extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Check if the player "falls off" of the track
func _on_track_body_exited(body):
	var scene_tree = get_tree()
	scene_tree.reload_current_scene()
