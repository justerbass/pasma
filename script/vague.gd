extends Node2D

var pos
var speed = 5


func _ready():
	$Timer.start()
	$AnimationPlayer.play("idle")
	$AnimatedSprite2D.hide()
	

##generacion de movimiento y animacion segun valor de direccion 
func _physics_process(delta):
	
	var velocity = Vector2.ZERO
	shock()
	
	if pos == 0:
		$Sprite2D.hide()
		$AnimationPlayer.stop()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "up"
		velocity.y -= speed
		

		
				
	elif pos == 1:
		$Sprite2D.hide()
		$AnimationPlayer.stop()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "down"
		velocity.y += speed
		
		

				
	elif pos == 2:
		$Sprite2D.hide()
		$AnimationPlayer.stop()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "left"
		velocity.x -= speed
		

				
	elif pos == 3:
		$Sprite2D.hide()
		$AnimationPlayer.stop()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "right"
		velocity.x += speed
		
	
				
	elif pos == 4:
		$AnimatedSprite2D.hide()
		$Sprite2D.show()
		$AnimationPlayer.play("idle")
		
		
	position += velocity * delta


func _on_timer_timeout():

	randomize()
	pos = int(randf_range(0, 5))


##funcion de deteccion de colision y movimiento contrario a la colision.
func shock():
	if $AnimatedSprite2D/RCUp.is_colliding():
		pos = 1
		
	elif  $AnimatedSprite2D/RCDown.is_colliding():
		pos = 0

	elif $AnimatedSprite2D/RCLeft.is_colliding():
		pos = 3

	elif  $AnimatedSprite2D/RCRight.is_colliding():
		pos = 2

