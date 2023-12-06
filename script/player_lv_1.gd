extends CharacterBody2D

const SPEED = 50
var sabio_in_range = false
var ballplayer_in_range = false
var vague_in_range = false
var guard_in_range = false

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

		
		
func SpeachVillage():
	
	if sabio_in_range:
		DialogueManager.show_example_dialogue_balloon(load("res://script/sabio.dialogue"), "start_sabio")
		return
		
	if guard_in_range:
		DialogueManager.show_example_dialogue_balloon(load("res://script/guard.dialogue"), "start_guard")
		return
		
	if ballplayer_in_range:
		DialogueManager.show_example_dialogue_balloon(load("res://scene/ball_player.tscn"), "start_ballplayer")
		return
		
	if vague_in_range:
		DialogueManager.show_example_dialogue_balloon(load("res://script/vague.dialogue"), "start_vague")
		return
		


func _on_area_2d_body_entered(body):
	if body is sabio:
		sabio_in_range = true
	if body is vague:
		vague_in_range = true
	if body is guard:
		guard_in_range = true
	if body is ballplayer:
		ballplayer_in_range = true


func _on_area_2d_body_exited(body):
	if body is sabio:
		sabio_in_range = false
	if body is vague:
		vague_in_range = false
	if body is guard:
		guard_in_range = false
	if body is ballplayer:
		ballplayer_in_range = false
