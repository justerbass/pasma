extends CharacterBody2D
class_name player

const SPEED = 50
var sabio_in_range = false
var ballplayer_in_range = false
var vague_in_range = false
var guard_in_range = false

func _physics_process(delta):
	
	## movimento del personaje
	var directions = Input.get_axis("UP", "DOWN")
	if directions:
		velocity.y = directions * SPEED
	else:
		velocity.y = move_toward(0, 0, SPEED)
		
		
	var direction = Input.get_axis("LEFT", "RIGHT")
	
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
		$Area2D/CollisionShape2D2.rotation_degrees = 270
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "left"
		$Area2D/CollisionShape2D2.rotation_degrees = 90
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
		$Area2D/CollisionShape2D2.rotation_degrees = 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
		$Area2D/CollisionShape2D2.rotation_degrees = 180
		
	
	move_and_slide()
	
	##activar dialogos con NPC
	SpeachVillage()

		

##sistema de dialogo de la villa

func SpeachVillage():
	
	if sabio_in_range:
		
		if Input.is_action_just_pressed("SPEAK"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/sabio.dialogue"), "start_sabio")
			return
		
	if guard_in_range:
		if Input.is_action_just_pressed("SPEAK"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/guard.dialogue"), "start_guard")
			return
		
	if ballplayer_in_range:
		if Input.is_action_just_pressed("SPEAK"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/BallPlayer.dialogue"), "start_ballplayer")
			return
		
	if vague_in_range:
		if Input.is_action_just_pressed("SPEAK"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/vague.dialogue"), "start_vague")
			return
		

func _on_area_2d_body_entered(body):
	if body is sabio:
		sabio_in_range = true
		$"../UIControl/CanvasLayer/speak_btn".show()
	if body is vague:
		vague_in_range = true
		$"../UIControl/CanvasLayer/speak_btn".show()
	if body is guard:
		guard_in_range = true
		$"../UIControl/CanvasLayer/speak_btn".show()
	if body is ballplayer:
		ballplayer_in_range = true
		$"../UIControl/CanvasLayer/speak_btn".show()


func _on_area_2d_body_exited(body):
	if body is sabio:
		sabio_in_range = false
		$"../UIControl/CanvasLayer/speak_btn".hide()
	if body is vague:
		vague_in_range = false
		$"../UIControl/CanvasLayer/speak_btn".hide()
	if body is guard:
		guard_in_range = false
		$"../UIControl/CanvasLayer/speak_btn".hide()
	if body is ballplayer:
		ballplayer_in_range = false
		$"../UIControl/CanvasLayer/speak_btn".hide()
