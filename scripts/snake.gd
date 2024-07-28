extends CharacterBody2D

@export var speed = 100.0

func _physics_process(delta):
	
	# Player will move in the direction of the respective action pressed
	if Input.is_action_pressed("up") && checkAlignment(position):
		velocity.y -= 1
		velocity.x = 0
	elif Input.is_action_pressed("down") && checkAlignment(position):
		velocity.y += 1
		velocity.x = 0
	elif Input.is_action_pressed("left") && checkAlignment(position):
		velocity.x -= 1
		velocity.y = 0
	elif Input.is_action_pressed("right") && checkAlignment(position):
		velocity.x += 1
		velocity.y = 0
	
	# Sets the player velocity
	velocity = velocity.normalized() * speed * delta
	
	# Ensures that player interacts with world boundaries
	move_and_collide(velocity)
	
	position = Vector2(round(position.x), round(position.y))
	
	if checkAlignment(position):
		print(position)

# Check if player is aligned with grid given current position and square size
func checkAlignment(position):
	var x = int(position.x)
	var y = int(position.y)
	
	if (x % 20 == 0) && (y % 20 == 0):
		return true
	return false
