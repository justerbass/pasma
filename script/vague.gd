extends Node2D

var direction


func _ready():
	$AnimationPlayer.play("idle")
	$Timer.start()



func _process(delta):
	if direction ==	0:
		$AnimationPlayer.stop()
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("up")
				
	elif direction == 1:
		$AnimationPlayer.stop()
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("down")
				
	elif direction == 	2:
		$AnimationPlayer.stop()
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("left")
				
	elif direction == 3:
		$AnimationPlayer.stop()
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("right")
				
	elif direction == 4:
		$AnimatedSprite2D.stop()
		$AnimationPlayer.play("idle")


func _on_timer_timeout():
	randomize()
	direction = int(randf_range(0, 5))
	print(direction)

