extends Area2D

# Specify magnitude of projectile velocity
@export var velocity_magnitude = 1000.0

# Get VisibleOnScreenNotifier2D node
@onready var visible_node = $VisibleOnScreenNotifier2D

func _ready():
	visible_node.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	# Update rocket position based on the velocity
	global_position.x += velocity_magnitude * delta

func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	queue_free()
	area.die()
