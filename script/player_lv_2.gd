extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -750.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	move_pl2()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("SPEAK") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT", "RIGHT")
	if direction:
		velocity.x = direction * SPEED
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()

## Animación de movimiento del player
func move_pl2():
	if not is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
			if velocity.x > 0:
				$AnimatedSprite2D.flip_h = false
				$detection/CollisionShape2D.rotation_degrees = 0
			elif velocity.x < 0:
				$AnimatedSprite2D.flip_h = true
				$detection/CollisionShape2D.rotation_degrees = 180
		else :
			$AnimatedSprite2D.play("fall")
			if velocity.x > 0:
				$AnimatedSprite2D.flip_h = false
				$detection/CollisionShape2D.rotation_degrees = 0
			elif velocity.x < 0:
				$AnimatedSprite2D.flip_h = true
				$detection/CollisionShape2D.rotation_degrees = 180
	else:
		if $AnimationCameraPlayer.current_animation == "bridge":
			SPEED = 0
			JUMP_VELOCITY = 0
		else:
			$AnimationCameraPlayer.play("RESET")
			SPEED = 300
			JUMP_VELOCITY = -750
		if velocity.x > 0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = false
			$detection/CollisionShape2D.rotation_degrees = 0
		elif velocity.x < 0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = true
			$detection/CollisionShape2D.rotation_degrees = 180
		else:
			if global.recycler:
				SPEED = 0
			else:
				$AnimatedSprite2D.play("idle")
				



func _on_hitbox_area_entered(area):
	if area.is_in_group("died"):
		position = $"../Reset".position
	
	if area.is_in_group("died2"):
		position = $"../Reset2".position
		
	if area.is_in_group("died3"):
		position = $"../Reset3".position

func _on_detection_body_entered(body):
	if body is recycler:
		$"../UIControl/CanvasLayer/take_btn".show()
		global.recycler = true
		
	if body is prize:
		$"../UIControl/CanvasLayer/take_btn".show()
		$"../UIControl/CanvasLayer/speak_btn".hide()


func _on_detection_body_exited(body):
	if body is recycler:
		$"../UIControl/CanvasLayer/take_btn".hide()
		global.recycler = false
		
	if body is prize:
		$"../UIControl/CanvasLayer/take_btn".hide()
	
