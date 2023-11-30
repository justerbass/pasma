extends CharacterBody2D


const SPEED = 50


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
		$Area2D/CollisionShape2D.rotation_degrees = 270
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "left"
		$Area2D/CollisionShape2D.rotation_degrees = 90
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
		$Area2D/CollisionShape2D.rotation_degrees = 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
		$Area2D/CollisionShape2D.rotation_degrees = 180
		
	
	move_and_slide()
