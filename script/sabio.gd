extends Node2D
class_name sabio

func _ready():
	$AnimatedSprite2D.play("wait")


func _on_animated_wait_timeout():
	$AnimatedSprite2D.play("wait")

