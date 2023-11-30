extends Node2D

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
	

func _physics_process(delta):
	pass

func _on_area_detec_fem_pl_body_entered(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".FemBallPlayer = true
		


func _on_area_detec_mal_pl_body_entered(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".MalBallPlayer = true


func _on_area_detec_fem_pl_body_exited(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".FemBallPlayer = false


func _on_area_detec_mal_pl_body_exited(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".MalBallPlayer = false
