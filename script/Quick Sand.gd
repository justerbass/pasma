extends AnimatableBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_parent().global_position
	


func _on_detection_area_entered(area):
	$"../AnimationPlayer".play("fall")
	await get_tree().create_timer(2).timeout
	queue_free()
	
