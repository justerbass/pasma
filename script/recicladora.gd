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
		$"../UIControl/CanvasLayer/take_btn".hide()
		
		##requisistos nivel metal
		if global.metal_count > 1  and global.plastic_count > 1 and global.paper_count > 1:
			"""metal 10, plastic 9, paper 9"""
			#ciclo de animacion de entrega de materiales
			while global.metal_count > 0:
				$"../PlayerLv2/AnimatedSprite2D".play("deliver")
				await get_tree().create_timer(1).timeout
				global.metal_count -= 1
				if global.metal_count < 0:
					global.metal_count = 0
				global.plastic_count -= 1
				if global.plastic_count < 0:
					global.plastic_count = 0
				global.paper_count -= 1
				if global.paper_count < 0:
					global.paper_count = 0
			if global.metal_count == 0 and global.plastic_count == 0 and global.paper_count == 0:
				$AnimationPlayer.play("work")
				$"../PlayerLv2/AnimatedSprite2D".stop()
				#construir el puente
				await get_tree().create_timer(3).timeout
				$AnimationPlayer.stop()
				$CollisionShape2D.disabled = true
				$"baliza azul".hide()
				$"baliza roja".show()
				$"../punete metal/AnimationMetalBridge".play("build")
				$"../PlayerLv2/AnimationCameraPlayer".play("bridge")
				await  get_tree().create_timer(30).timeout
				$CollisionShape2D.disabled = false
				$"baliza azul".show()
				$"baliza roja".hide()
		else:
			
			##requisitos nivel plastico
			if global.plastic_count > 1 and global.paper_count > 1:
				"""plastic 13, paper 10"""
				#ciclo de animacion de entrega de materiales
				while global.plastic_count > 0:
					$"../PlayerLv2/AnimatedSprite2D".play("deliver")
					await get_tree().create_timer(1).timeout
					global.plastic_count -= 1
					if global.plastic_count < 0:
						global.plastic_count = 0
					global.paper_count -= 1
					if global.paper_count < 0:
						global.paper_count = 0
				if global.plastic_count == 0 and global.paper_count == 0:
					$AnimationPlayer.play("work")
					$"../PlayerLv2/AnimatedSprite2D".stop()
					#construir el puente
					await get_tree().create_timer(3).timeout
					$AnimationPlayer.stop()
					$CollisionShape2D.disabled = true
					$"baliza azul".hide()
					$"baliza roja".show()
					$"../puente plastico/AnimationPlasticBridge".play("build")
					$"../PlayerLv2/AnimationCameraPlayer".play("bridge")
					await  get_tree().create_timer(30).timeout
					$CollisionShape2D.disabled = false
					$"baliza azul".show()
					$"baliza roja".hide()
			
			else:
			##requisitos nivel papel
				if global.paper_count > 10:
					#ciclo de animacion de entregar papel
					while global.paper_count > 0:
						$"../PlayerLv2/AnimatedSprite2D".play("deliver")
						await get_tree().create_timer(1).timeout
						global.paper_count -= 1
						if global.paper_count < 0:
							global.paper_count = 0
						
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
						$"../puente papel/AnimationPlayer".play("build")
						$"../PlayerLv2/AnimationCameraPlayer".play("bridge")
						await  get_tree().create_timer(30).timeout
						$CollisionShape2D.disabled = false
						$"baliza azul".show()
						$"baliza roja".hide()
					
				else:
					DialogueManager.show_example_dialogue_balloon(load("res://script/recycler.dialogue"), "start_recycler")
					$CollisionShape2D.disabled = true
					await  get_tree().create_timer(3).timeout
					$CollisionShape2D.disabled = false
					return
