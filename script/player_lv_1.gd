extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):

	var directions = Input.get_axis("ui_up", "ui_down")
	if directions:
		velocity.y = directions * SPEED
	else:
		velocity.y = move_toward(0, 0, SPEED)

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(0, 0, SPEED)

	move_and_slide()
