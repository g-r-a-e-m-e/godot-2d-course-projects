extends Area2D

# Send signal to game scene
signal enemy_died

# Specify magnitude of projectile velocity
@export var velocity_magnitude = 750.0

# Get VisibleOnScreenNotifier2D node
@onready var visible_node = $VisibleOnScreenNotifier2D

func _ready():
	visible_node.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	# Update enemy position based on the velocity
	global_position.x -= velocity_magnitude * delta

func _on_screen_exited():
	queue_free()

func die():
	emit_signal("enemy_died")
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()
