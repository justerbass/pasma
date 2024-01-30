extends Control

	

func _process(delta):
	
	score()
	mision()
	ui_for_levels()
	
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
		
	if global.paper_count > 0:
		$CanvasLayer/paper.show()
		$CanvasLayer/paper_count.show()
		$CanvasLayer/paper_count.text = str(global.paper_count)
	else:
		$CanvasLayer/paper.hide()
		$CanvasLayer/paper_count.hide()
		
	if global.plastic_count > 0:
		$CanvasLayer/plastic.show()
		$CanvasLayer/plastic_count.show()
		$CanvasLayer/plastic_count.text = str(global.plastic_count)
	else :
		$CanvasLayer/plastic.hide()
		$CanvasLayer/plastic_count.hide()
		
	if global.metal_count > 0:
		$CanvasLayer/metal.show()
		$CanvasLayer/metal_count.show()
		$CanvasLayer/metal_count.text = str(global.metal_count)
	else :
		$CanvasLayer/metal.hide()
		$CanvasLayer/metal_count.hide()
	
	if global.glass_count > 0:
		$CanvasLayer/glass.show()
		$CanvasLayer/glass_count.show()
		$CanvasLayer/glass_count.text = str(global.glass_count)
	else :
		$CanvasLayer/glass.hide()
		$CanvasLayer/glass_count.hide()

func _on_take_btn_pressed():
	if global.level == 1:
		get_tree().change_scene_to_file("res://scene/end_level.tscn")
		
	elif global.level == 2 and global.recycler == false:
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

## UI por levels

func ui_for_levels():
	if global.level == 0:
		$CanvasLayer.hide()
	if global.level == 1:
		$CanvasLayer.show()
	if global.level == 2:
		$CanvasLayer.show()
		$"CanvasLayer/Mision 1".hide()
		$"CanvasLayer/Mision 4".hide()
		$CanvasLayer/up_btn.hide()
		$CanvasLayer/down_btn.hide()
		$CanvasLayer/Animatedheart50.hide()
		$CanvasLayer/Animatedheart100.hide()
		$CanvasLayer/Animatedheart150.hide()
		$CanvasLayer/Animatedheart200.hide()
		if global.recycler:
			$CanvasLayer/speak_btn.hide()
		else:
			$CanvasLayer/speak_btn.show()
	
