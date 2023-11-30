extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"/root/UiDialogue".FemBallPLayer == true:
		_activar($"/root/UiDialogue".WordsVillague.FemBallPLayer.pd[0], $CanvasLayer/TextureRect/FemBallPlayer.show)


##para mostrar la interfaz del texto
func _activar(TEXTO:String, IMAGEN:Texture):
	$CanvasLayer.show()
	TEXTO = $CanvasLayer/PanelContainer/RichTextLabel.text
	IMAGEN = $CanvasLayer/TextureRect.texture
	

