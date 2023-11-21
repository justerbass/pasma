extends Node2D

func _ready():
	
	$FemalePlayer.play()
	$Maleshot.start()
	$WaitShot.start()
	$Path2D/PathFollow2D/AnimationPlayer.play("shot")

func _on_maleshot_timeout():
	$MalePlayer.play()

func _on_wait_shot_timeout():
	$FemalePlayer.play()
	$MalePlayer.stop()
	
