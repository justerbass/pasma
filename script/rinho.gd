extends CharacterBody2D


var SPEED = 30
var run = 60
var health = 100
var damage
var death = false
var pos
var runing
var player_in_area = false
var prey

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	$AnimationPlayer.play("enemy")


func _physics_process(delta):
	
	dead()
	shock()
	
	velocity = Vector2.ZERO
	
	if player_in_area:
		###persigue al jugador
		position += (prey.position - position)/ run
		
	else:
		###movimento random
		match pos:
			0: velocity.x += SPEED
			1: velocity.x -= SPEED
			2: velocity.y += SPEED
			3: velocity.y -= SPEED
			4: velocity = Vector2.ZERO

		position += velocity * delta
	



func _on_timer_timeout():
	pos = int(randf_range(0, 5))


func _on_area_detection_body_entered(body):
	if body is player:
		$Timer.stop()
		player_in_area = true
		prey = body


func _on_area_detection_body_exited(body):
	if body is player:
		$Timer.start()
		player_in_area = false
		
func dead():
	if health > 0 and health < 100:
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("half")
		
	if health == 0:
		death = true

	if death:
		$AreaDetection/CollisionShape2D.disabled = true
		$hitbox/CollisionShape2D.disabled = true
		$RhinoPace.show()
		$Rhino.hide()
		SPEED = 3
	else :
		$AreaDetection/CollisionShape2D.disabled = false



func _on_body_rinho_area_entered(area):
	if area.is_in_group("peace"):
		health -= 50
		$AnimationPlayer.play("damage")
		
	if area.is_in_group("clap"):
		position = $"../MarkerRinho".position
		health = 100
		_ready()
		
	if area.is_in_group("resticted"):
		position = ($"../MarkerRinho".position)
		health = 100
		_ready()

func shock():
	if $RayCastUp.is_colliding():
		pos = 2
		
	elif $RayCastDown.is_colliding():
		pos = 3
		
	elif $RayCastRight.is_colliding():
		pos = 1
		
	elif $RayCastLeft.is_colliding():
		pos = 0


func _on_hitbox_area_entered(area):
	pass # Replace with function body.

