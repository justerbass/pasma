extends Node2D

func _ready():
	$AnimatedSprite2D.play("wait")


func _on_animated_wait_timeout():
	$AnimatedSprite2D.play("wait")


func _on_area_2d_body_entered(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".sabio = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("interactuar"):
		$"/root/UiDialogue".sabio = false
