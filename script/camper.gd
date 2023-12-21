extends CharacterBody2D
class_name  camper


func _ready():
	$AnimationPlayer.play("idel")
	
func _process(delta):
	
	learn_pace()
	
	
func learn_pace():
	if global.player_peace_teach:
		
		await get_tree().create_timer(10).timeout
		global.player_peace_teach = false
		
