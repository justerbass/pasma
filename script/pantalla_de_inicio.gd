extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	$CanvasLayer/Label3.show()
	$CanvasLayer/Label5.show()
	$Timer2.start()
	
	
func _on_timer_2_timeout():
	$Timer2.stop()
	$CanvasLayer/Label3.hide()
	$CanvasLayer/Label5.hide()
	
	
