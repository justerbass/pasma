extends Sprite2D

@export var texto = ""
var index = 0

func _on_timer_letter_timeout():
	$"../TimerEndGame".start()


func _on_timer_end_game_timeout():
	if index >= texto.length():
		$"../TimerEndGame".stop()
	else:
		$Yuhu.text = $Yuhu.text + texto[index]
		index += 1
