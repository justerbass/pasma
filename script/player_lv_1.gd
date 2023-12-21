extends CharacterBody2D
class_name player

const SPEED = 50
var sabio_in_range = false
var ballplayer_in_range = false
var vague_in_range = false
var guard_in_range = false
var camper_in_range = false
var iner_peace_cooldown = true
var iner_peace = preload("res://scene/peace.tscn")
var clap = preload("res://scene/clap.tscn")
var healt = 200


func _physics_process(delta):
	
	life()
		
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
		
		
	if absf(velocity.x) == absf(velocity.y):
			velocity = Vector2.ZERO
	move_and_slide()
	
	##activar dialogos con NPC
	SpeachVillage()
	

##sistema de dialogo

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
		
	if camper_in_range:
		if Input.is_action_just_pressed("SPEAK"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/camper.dialogue"), "start_camper")
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
	if body is camper:
		camper_in_range = true
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
	if body is camper:
		camper_in_range = false
		$"../UIControl/CanvasLayer/speak_btn".hide()

##Sistema de ataques
func _input(event):
	if event.is_action_pressed("POWER") and iner_peace_cooldown:
		var new_iner_peace = iner_peace.instantiate()
		if $AnimatedSprite2D.animation == "up":
			new_iner_peace.up_peace = true
		elif $AnimatedSprite2D.animation == "down":
			new_iner_peace.down_peace = true
		elif $AnimatedSprite2D.animation == "right":
			new_iner_peace.right_peace = true
		elif $AnimatedSprite2D.animation == "left":
			new_iner_peace.left_peace = true
		add_child(new_iner_peace)
		iner_peace_cooldown = false
		
		await get_tree().create_timer(0.6).timeout
		iner_peace_cooldown = true
		
	if event.is_action_pressed("ATTACK"):
		var new_clap = clap.instantiate()
		add_child(new_clap)
		await get_tree().create_timer(0.7).timeout
		new_clap.queue_free()
		

##sistema de daño
func _on_area_damage_area_entered(area):
	if area.is_in_group("enemy"):
		healt -= 51
		$AudioStreamPlayer.play()

func life():
	
	
	if  healt == 149:
		$"../UIControl"/CanvasLayer/Animatedheart200.play("heart")
		await get_tree().create_timer(0.5).timeout
		healt = 150
	
	if healt == 99:
		$"../UIControl"/CanvasLayer/Animatedheart150.play("heart")
		await get_tree().create_timer(0.5).timeout
		healt = 100
	
	if  healt == 49:
		$"../UIControl"/CanvasLayer/Animatedheart100.play("heart")
		await get_tree().create_timer(0.5).timeout
		healt = 50
	
	if healt <= 0:
		$"../UIControl"/CanvasLayer/Animatedheart50.play("heart")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scene/game_over.tscn")
		

	if global.player_peace_learned:
		pass
	else:
		if healt < 50 and healt >= 0:
			healt += 0.05
			$"../UIControl"/CanvasLayer/Animatedheart50.play("recover")
			$"../UIControl"/CanvasLayer/Animatedheart100.stop()
			$"../UIControl"/CanvasLayer/Animatedheart150.stop()
			$"../UIControl"/CanvasLayer/Animatedheart200.stop()
		else:
			if healt < 100 and healt >= 50:
				healt += 0.05
				$"../UIControl"/CanvasLayer/Animatedheart100.play("recover")
				$"../UIControl"/CanvasLayer/Animatedheart150.stop()
				$"../UIControl"/CanvasLayer/Animatedheart200.stop()
			else:
				if healt < 150 and healt >= 100:
					healt += 0.05
					$"../UIControl"/CanvasLayer/Animatedheart150.play("recover")
					$"../UIControl"/CanvasLayer/Animatedheart200.stop()
				else:
					if healt < 200 and healt >= 150:
						healt += 0.05
						$"../UIControl"/CanvasLayer/Animatedheart200.play("recover")

		if healt >= 200:
			$"../UIControl"/CanvasLayer/Animatedheart200.stop()
			$"../UIControl"/CanvasLayer/Animatedheart200.play("heart")
			$"../UIControl"/CanvasLayer/Animatedheart200.stop()
		else:
			if healt >= 150:
				$"../UIControl"/CanvasLayer/Animatedheart150.stop()
				$"../UIControl"/CanvasLayer/Animatedheart150.play("heart")
				$"../UIControl"/CanvasLayer/Animatedheart150.stop()
			else:
				if healt >= 100:
					$"../UIControl"/CanvasLayer/Animatedheart100.stop()
					$"../UIControl"/CanvasLayer/Animatedheart100.play("heart")
					$"../UIControl"/CanvasLayer/Animatedheart100.stop()
				else:
					if healt >= 50:
						$"../UIControl"/CanvasLayer/Animatedheart50.stop()
						$"../UIControl"/CanvasLayer/Animatedheart50.play("heart")
						$"../UIControl"/CanvasLayer/Animatedheart50.stop()
