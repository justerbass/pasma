extends Sprite2D

@export var texto = ""
var index = 0



func _on_timer_end_game_timeout():
	if index >= texto.length():
		$"../TimerEndGame".stop()
	else:
		$EndGameText.text = $EndGameText.text + texto[index]
		index += 1


func _on_timer_leter_timeout():
	$"../TimerEndGame".start()
