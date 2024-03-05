extends Area2D

# Specify magnitude of projectile velocity
@export var velocity_magnitude = 25

func _physics_process(delta):
	global_position.x += velocity_magnitude
