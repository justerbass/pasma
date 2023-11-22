extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	cycle1()
	cycle2()


func cycle1():
	move()
	pick()
	up1()


##funcion de movimiento ciclico
func move():
	$Path2D/PathFollow2D/AnimationPlayer.play("hang")
	$Path2D/PathFollow2D/AnimatedSprite2D.play("side")
	$Path2D/PathFollow2D/AnimatedSprite2D.show()
	$Path2D/PathFollow2D/AnimatedSprite2D.flip_h = false
	$back.start()
	$hide.start()
	$restart.start()

##timer para ejecutar el movimento de regreso
func _on_back_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.flip_h = true
	$upw3.stop()


##timer para desaparecer al regresar a la casa
func _on_hide_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.hide()

##timer para reiniciar el moviemto
func _on_restart_timeout():
	cycle1()


##funcion de recogida de ropa
func pick():
	$pick1.start()
	$pick2.start()
	$pick3.start()
	$pick4.start()
	$pick5.start()
	$pick6.start()


func _on_pick_1_timeout():
	$Cc1.hide()


func _on_pick_2_timeout():
	$Cc2.hide()


func _on_pick_3_timeout():
	$Cc3.hide()


func _on_pick_4_timeout():
	$WC1.hide()


func _on_pick_5_timeout():
	$WC2.hide()


func _on_pick_6_timeout():
	$WC3.hide()

##funcion de movimiento de recogida
func up1():
	$upc1.start()
	$upc2.start()
	$upc3.start()
	$upw1.start()
	$upw2.start()
	$upw3.start()
	


func _on_upc_1_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.start()


func _on_upc_2_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.stop()
	$upstop.start()
	$upc1.stop()


func _on_upc_3_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.stop()
	$upstop.start()
	$upc2.stop()


func _on_upw_1_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.stop()
	$upstop.start()
	$upc3.stop()


func _on_upw_2_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.stop()
	$upstop.start()
	$upw1.stop()


func _on_upw_3_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("tend")
	$upstop.stop()
	$upstop.start()
	$upw2.stop()


func _on_upstop_timeout():
	$Path2D/PathFollow2D/AnimatedSprite2D.stop()
	$Path2D/PathFollow2D/AnimatedSprite2D.play("side")

##funcion de tender ropa
func hanged():
	$put1.start()
	$put2.start()
	$put3.start()
	$put4.start()
	$put5.start()
	$put6.start()


func _on_put_1_timeout():
	$Cc1.show()
	$pick1.stop()


func _on_put_2_timeout():
	$Cc2.show()
	$pick2.stop()


func _on_put_3_timeout():
	$Cc3.show()
	$pick3.stop()


func _on_put_4_timeout():
	$WC1.show()
	$pick4.stop()


func _on_put_5_timeout():
	$WC2.show()
	$pick5.stop()


func _on_put_6_timeout():
	$WC3.show()
	$pick6.stop()


func _on_restart_2_timeout():
	hanged()

func cycle2():
	hanged()
	$restart2.start()
