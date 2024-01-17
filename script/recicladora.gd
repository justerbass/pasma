extends Node2D
class_name recycler


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	paper_recycled()

func paper_recycled():
	if Input.is_action_just_pressed("TAKE"):
		if global.paper_count > 10:
			#ciclo de animacion de entregar papel
			while global.paper_count != 0:
				$"../PlayerLv2/AnimatedSprite2D".play("deliver")
				await get_tree().create_timer(1).timeout
				global.paper_count -= 1
			#hacer funcionar la maquina
			if global.paper_count == 0:
				$AnimationPlayer.play("work")
				$"../PlayerLv2/AnimatedSprite2D".stop()
			#construir el puente
				await get_tree().create_timer(3).timeout
				$AnimationPlayer.stop()
				$CollisionShape2D.disabled = true
				$"baliza azul".hide()
				$"baliza roja".show()
				##falta hacer aparecer el puente"""
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://script/recycler.dialogue"), "start_recycler")
			return
