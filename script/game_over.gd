extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_screen_exit_pressed():
	get_tree().quit()


func _on_touch_screen_restart_pressed():
	get_tree().change_scene_to_file("res://.godot/exported/133200997/export-6a7c9d6f39dec6056a2a0fb23be7796c-level_1.scn")
