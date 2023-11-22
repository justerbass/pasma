extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Path2D/PathFollow2D/AnimationPlayer.play("hang")
	$Path2D/PathFollow2D/AnimatedSprite2D.play("side")
	$Path2D/PathFollow2D/AnimatedSprite2D.show()
	$Path2D/PathFollow2D/AnimatedSprite2D.flip_h = false
	$back.start()
	$hide.start()
	$restart.start()


func _on_back_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.flip_h = true
	


func _on_hide_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.hide()


func _on_restart_timeout():
	_ready()
