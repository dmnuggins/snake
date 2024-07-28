extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta):
	
	# Player will move in the direction of the respective action pressed
	if Input.is_action_pressed("up"):
		velocity.y -= speed * delta
		velocity.x = 0
	elif Input.is_action_pressed("down"):
		velocity.y += speed * delta
		velocity.x = 0
	elif Input.is_action_pressed("left"):
		velocity.x -= speed * delta
		velocity.y = 0
	elif Input.is_action_pressed("right"):
		velocity.x += speed * delta
		velocity.y = 0
	
	# Sets the player velocity
	velocity = velocity.normalized() * speed
	
	# Ensures that player interacts with world boundaries
	move_and_slide()
