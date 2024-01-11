extends Control

	

func _process(delta):
	
	score()
	mision()
	
	if global.player_aplause_learned:
		$CanvasLayer/aplause_btn.show()
		
	if global.player_peace_learned:
		$CanvasLayer/peace_btn.show()
	else:
		if global.player_peace_teach:
			$CanvasLayer/peace_btn.show()
		else:
			$CanvasLayer/peace_btn.hide()
			
	if global.enemigos_faltantes_score:
		$CanvasLayer/rest.show()
		$CanvasLayer/Label.show()
		
	if global.enemigos_faltantes > 15:
		$CanvasLayer/Label.hide()
		$CanvasLayer/rest.hide()
		$CanvasLayer/ready.show()
		
func _on_peace_btn_pressed():
	pass

func _on_aplause_btn_pressed():
	pass

func _on_speak_btn_pressed():
	$CanvasLayer/speak_btn.hide()

func _on_quit_btn_pressed():
	get_tree().quit()

func _on_right_btn_pressed():
	pass

func _on_left_btn_pressed():
	pass

func _on_down_btn_pressed():
	pass

func _on_up_btn_pressed():
	pass

func score():
	
	if global.enemigos_faltantes > 2:
		$CanvasLayer/rest.text = str(int(global.enemigos_faltantes))
	else :
		$CanvasLayer/rest.text = str(2)

func _on_take_btn_pressed():
	get_tree().change_scene_to_file("res://scene/end_level.tscn")

## Mostrar Misiones activas
func mision() -> void:
	if global.player_aplause_learned:
		$"CanvasLayer/Mision 1".hide()
		$"CanvasLayer/Mision 2".show()
	if global.player_peace_learned:
		$"CanvasLayer/Mision 2".hide()
		$"CanvasLayer/Mision 3".show()
	if global.enemigos_faltantes > 15:
		$"CanvasLayer/Mision 3".hide()
		$"CanvasLayer/Mision 4".show()
