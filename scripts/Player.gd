extends CharacterBody2D

@export var speed = 50.0

enum MoveType {
	VERTICAL,
	HORIZONTAL
}

var inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

var current_direction = null
var next_direction

# however if IDLE (aka not moving), new set of physics process to handle initial move
# can be set to the move state
func _physics_process(delta):
	
	# Player will move in the direction of the respective action pressed
	if isAligned():
		if current_direction != MoveType.VERTICAL:
			if Input.is_action_pressed("up"):
				velocity = Vector2(0,-1)
				current_direction = MoveType.VERTICAL
			elif Input.is_action_pressed("down"):
				velocity = Vector2(0,1)
				current_direction = MoveType.VERTICAL
		if current_direction != MoveType.HORIZONTAL:
			if Input.is_action_pressed("left"):
				velocity = Vector2(-1,0)
				current_direction = MoveType.HORIZONTAL
			elif Input.is_action_pressed("right"):
				velocity = Vector2(1,0)
				current_direction = MoveType.HORIZONTAL
		
	# When aligned check here, then set velocity with queued action
	
	# Sets the player velocity
	velocity = velocity.normalized() * speed * delta
	
	# Ensures that player interacts with world boundaries
	move_and_collide(velocity)
	
	position = Vector2(round(position.x), round(position.y))
	
	if isAligned():
		print(position)

# Changes the direction of the snake if aligned
func changeDirection():
	pass

# Check if player is aligned with grid given current position and square size
func isAligned():
	var x = int(position.x)
	var y = int(position.y)
	
	if (x % 20 == 0) && (y % 20 == 0):
		return true
	return false
	
	# emit a signal to indicate player is aligned?
