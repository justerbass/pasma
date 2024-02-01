extends Sprite2D

@export var texto = ""
var index = 0


func _on_timer_timeout():
	if index >= texto.length():
		$"../Timer".stop()
	else:
		$LabelIntro.text = $LabelIntro.text + texto[index]
		index += 1
