extends CharacterBody2D

func _physics_process(delta):
	var velocity_amount = 500.0
	if Input.is_action_pressed("move_up"):
		velocity.y = -velocity_amount
	if Input.is_action_pressed("move_left"):
		velocity.x = -velocity_amount
	if Input.is_action_pressed("move_down"):
		velocity.y = velocity_amount
	if Input.is_action_pressed("move_right"):
		velocity.x = velocity_amount
	move_and_slide()
