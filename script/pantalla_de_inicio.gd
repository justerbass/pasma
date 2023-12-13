extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("SPEAK"):
		get_tree().change_scene_to_file("res://scene/level_1.tscn")



func _on_timer_timeout():
	$CanvasLayer/Label3.show()
	$CanvasLayer/Label5.show()
	$Timer2.start()
	

func _on_timer_2_timeout():
	$Timer2.stop()
	$CanvasLayer/Label3.hide()
	$CanvasLayer/Label5.hide()
	
	

func _on_timer_4_timeout():
	$CanvasLayer/Label.show()
	$CanvasLayer/Label4.show()
	$Timer.start()
	$Timer3.start()
