extends Control

func _ready():
	global.level = 0


func _on_touch_screen_restart_pressed():
	get_tree().change_scene_to_file("res://scene/select_level.tscn")


func _on_touch_screen_exit_pressed():
	get_tree().quit()
