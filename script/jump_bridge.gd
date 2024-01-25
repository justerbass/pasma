extends Node2D

@export var top = Vector2(24745, 875)
@export var bottom = Vector2(24745, 1200)

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_detection_area_entered(area):
	fall()
	

func _on_detection_area_exited(area):
	up()
	


func fall():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", bottom, 5)
	
	
func up():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", top, 5)
	
