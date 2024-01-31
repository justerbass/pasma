extends Node2D


func _on_resume_pressed():
	$UI.hide()
	get_tree().paused = false
