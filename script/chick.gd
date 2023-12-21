extends CharacterBody2D



var health = 100

var death = false


func _ready():
	$AnimationPlayer.play("half")

func _physics_process(delta):
	dead()
	
func dead():
		
	
	if health > 0 and health < 100:
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("half")
		
	if health == 0:
		
		death = true
	
	if death:
		$hitbox/CollisionShape2D.disabled = true
		$ChickPace.show()
		$Chick.hide()


func _on_hitbox_area_entered(area):
	pass # Replace with function body.

func _on_body_chick_area_entered(area):
	if area.is_in_group("peace"):
		health -= 50
		$AnimationPlayer.play("damage")
	
	if area.is_in_group("clap"):

		health = 100
		$AnimationPlayer.play("enemy")

