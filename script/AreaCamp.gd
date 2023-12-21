extends Area2D

###audio del campamento con deteccion de player.

func _on_body_entered(body):
	if body is player:
		$AudioCamp.play()
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Backgroud"), true)
		

func _on_body_exited(body):
	if body is player:
		$AudioCamp.stop()
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Backgroud"), false)
		for i in range(-1000, -10):
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Backgroud"), i)
			

