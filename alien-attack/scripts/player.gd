extends CharacterBody2D

# Declare screen_size variable
var screen_size

# Specify magnitude of velocity
@export var velocity_magnitude = 750.0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("shoot"):
		shoot()

func _physics_process(delta):
	# Reset velocity to 0 at the start of each frame
	velocity = Vector2(0.0, 0.0) 
	
	# Listen for WASD/Arrow Key inputs
	if Input.is_action_pressed("move_up"):
		velocity.y = -velocity_magnitude
	if Input.is_action_pressed("move_left"):
		velocity.x = -velocity_magnitude
	if Input.is_action_pressed("move_down"):
		velocity.y = velocity_magnitude
	if Input.is_action_pressed("move_right"):
		velocity.x = velocity_magnitude
	
	# Normalize velocity if two or more directions are pressed simultaneously
	if (Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left")) and (Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up")):
		velocity = velocity.normalized()
		velocity *= velocity_magnitude
	
	# Apply velocity to player
	move_and_slide()
	
	# Prevent player movement from exceeding screen size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot():
	pass
