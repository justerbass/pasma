extends Node

var BallPLayer = false
var sabio = false
var vague = false
var guard = false
var object_name
var object_dialogue = []

##todos los dialogos de los NPC
const WordsVillague:Dictionary = {
	"guard" : {
		"pd" : ["Saludos", "Anda a ver al sabio para que puedas ir al mundo exterior tranquilo,
	de otra sera una odisea saber hasta donde puedas llegar"] },
	
	"vague" : {
		"pd" : ["¡NO TE ME ACERQUES!, estoy buscando la paz interior"]
	},
	
	"FemBallPlayer" : {
		"pd": ["Nos encanta jugar con la pelota","Podemos estas así todo el día"] 
	},
	
	"MalBallPlayer" : {
		"pd": ["Nos encanta jugar con la pelota","Podemos estas así todo el día"] 
	},
	
	"sabio" : {
		"pd" : ["¡QUIETO!, no te alejes", "Joven, he estado observando tus acciones con gran interés. 
		Has demostrado una gran bondad y compasión, así como un fuerte sentido de la justicia",
		"Bueno, si no me crees tendre que sacar toda mi sabiduria, dandote un consejo de un 
		coacher de Mier....", "Para poder devolver la calma a esta región, la paz interior es la 
		cuestion.", "Si no sabes en donde encontrar, la calma perderas.", "Te resulto útil...",
		"Bueno es lo que te puedo enseñar, si necesitas mas anda al campamento al norte del pueblo.", 
		"Para auyentar a los animales aplaudirles en la cara funcionara.", "Buen Viaje, Joven Aventurero 
		y no olvides...."]
		}
}

func _dialogos():
	match object_dialogue:
		
		"guard" : 
			object_dialogue = ["Saludos", "Anda a ver al sabio para que puedas ir al mundo exterior 
			tranquilo, de otra sera una odisea saber hasta donde puedas llegar"]
	
		"vague" : 
			object_dialogue = ["¡NO TE ME ACERQUES!, estoy buscando la paz interior"]

		"BallPlayer" : 
			object_dialogue = ["Nos encanta jugar con la pelota","Podemos estas así todo el día"]
	
		"sabio" : 
			object_dialogue = ["¡QUIETO!, no te alejes", "Joven, he estado observando tus acciones con gran interés. 
		Has demostrado una gran bondad y compasión, así como un fuerte sentido de la justicia",
		"Bueno, si no me crees tendre que sacar toda mi sabiduria, dandote un consejo de un 
		coacher de Mier....", "Para poder devolver la calma a esta región, la paz interior es la 
		cuestion.", "Si no sabes en donde encontrar, la calma perderas.", "Te resulto útil...",
		"Bueno es lo que te puedo enseñar, si necesitas mas anda al campamento al norte del pueblo.", 
		"Para auyentar a los animales aplaudirles en la cara funcionara.", "Buen Viaje, Joven Aventurero 
		y no olvides...."]


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


