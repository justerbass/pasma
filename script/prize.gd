extends Node2D
class_name prize


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.enemigos_faltantes > 15:
		$".".show()
		$CollisionShape2D.show()
	else :
		$".".hide()
		$CollisionShape2D.hide()
