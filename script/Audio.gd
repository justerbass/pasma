extends TabBar


func _ready():
	
	for i in range(4):
		Menu.config.get_value("Audio", str(i))
		if Menu.config.get_value("Audio", str(i)) != null:
	
			%Master.value = Menu.config.get_value("Audio", "0")
			AudioServer.set_bus_volume_db(0, linear_to_db(%Master.value))
			
			%Music.value = Menu.config.get_value("Audio", "1")
			AudioServer.set_bus_volume_db(1, linear_to_db(%Music.value))
			
			%Music.value = Menu.config.get_value("Audio", "2")
			AudioServer.set_bus_volume_db(2, linear_to_db(%Music.value))
			
			%SFX.value = Menu.config.get_value("Audio", "3")
			AudioServer.set_bus_volume_db(3, linear_to_db(%SFX.value))
		else:
			return
	
	



func _on_master_value_changed(value):
	set_volume(0, value)


func _on_music_value_changed(value):
	set_volume(1, value)
	set_volume(2, value)


func _on_sfx_value_changed(value):
	set_volume(3, value)
	

func set_volume(idx, value):
	AudioServer.set_bus_volume_db(idx, linear_to_db(value))
	Menu.config.set_value("Audio", str(idx), value)
	Menu.save_data()
