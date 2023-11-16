extends CharacterBody2D


const SPEED = 30


func _physics_process(delta):
	
	## movimento del personaje
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
		
		
	## animacion del personaje
	
	if velocity.length() != 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	## animacion segun direccion de movimiento
		
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "right"
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "left"
	
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
		
	
	move_and_slide()
