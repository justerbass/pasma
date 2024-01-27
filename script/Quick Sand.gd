extends CharacterBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_detection_area_entered(area):
	$AnimationPlayer.play("fall")
	
