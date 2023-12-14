extends CharacterBody2D


const SPEED = 50
var run = 60
var health = 100
var damage
var death = false
var pos
var runing
var player_in_area = false
var prey

func _ready():
	$AnimationPlayer.play("enemy")

func _physics_process(delta):
	
	dead()
	
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


func _on_timer_movement_timeout():
	
	pos = int(randf_range(0, 5))


func _on_area_detection_body_entered(body):
	if body is player:
		$TimerMovement.stop()
		player_in_area = true
		prey = body


func _on_area_detection_body_exited(body):
	if body is player:
		$TimerMovement.start()
		player_in_area = false

func dead():
	if death:
		$AreaDetection/CollisionShape2D.disabled = true
		$SnakePace.show()
		$Snake.hide()
	else :
		$AreaDetection/CollisionShape2D.disabled = false
	


func _on_hitbox_area_entered(area):
	pass # Replace with function body.
	

