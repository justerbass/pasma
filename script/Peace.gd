extends Node2D
var move_peace = Vector2.ZERO
var speed_peace = 30
var up_peace = false
var down_peace = false
var right_peace = false
var left_peace = false


func _ready():
	if up_peace:
		move_peace = Vector2 (0, -10)
	if down_peace:
		move_peace = Vector2 (0, 10)
	if right_peace:
		move_peace = Vector2 (10, 0)
	if left_peace:
		move_peace = Vector2 (-10, 0)


func _process(delta):
	
	position += speed_peace * move_peace * delta


func _on_visible_on_screen_enabler_2d_screen_entered():
	$AudioStreamPlayer.play()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_peace_hit_box_body_entered(body):
	pass
