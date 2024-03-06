extends Area2D

# Specify magnitude of projectile velocity
@export var velocity_magnitude = 25

func _physics_process(delta):
	# Update rocket position based on the rocket's velocity
	global_position.x += velocity_magnitude * delta
