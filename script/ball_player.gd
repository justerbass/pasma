extends Node2D
class_name ballplayer

##funcion que ejecuta la jugabilidad
func _ready():
	
	$FemalePlayer.play()
	$Maleshot.start()
	$WaitShot.start()
	$Path2D/PathFollow2D/AnimationPlayer.play("shot")

## timer para ejecutar el movimiento del jugador
func _on_maleshot_timeout():
	$MalePlayer.play()

##timer para ejecutar el movimento de la jugadora
func _on_wait_shot_timeout():
	$FemalePlayer.play()
	$MalePlayer.stop()
	



