extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.velocity = Vector2(0,0)


func physics_update(_delta: float) -> void:
	
	if Input.is_action_just_pressed("up") \
	or Input.is_action_just_pressed("down") \
	or Input.is_action_just_pressed("left") \
	or Input.is_action_just_pressed("right"):
		finished.emit(MOVING)
