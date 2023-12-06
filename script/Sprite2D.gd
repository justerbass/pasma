extends Sprite2D

@export var texto = ""
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_3_timeout():
	if index >= texto.length():
		$"../../Timer3".stop()
	else:
		$Label2.text = $Label2.text + texto[index]
		index += 1
	
