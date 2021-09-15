extends Node2D


var dialogo = [
	'Han encontrado el cuerpo de Soledad',
	'¡Debemos hacer justicia y encontrar al culpable!',
	'Los sospechosos son:',
	'Celeste, Amapola, Blanco, Prado y Mora',
	'Las posibles armas son:',
	'Soga, Tijeras, Hacha, Martillo, Bate',
	'Las posibles ubicaciones son:',
	'Sala, Dormitorio, Jardin, Sotano, Cocina',
	'Recuerda, para ganar este juego debes elegir la ubicacion, el arma y al asesino'
]

var dialogo_index = 0
var text_speed = 0.01

func _ready():
	pass 
 
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if dialogo_index < dialogo.size():
			$RichTextLabel.bbcode_text = dialogo[dialogo_index]
			$RichTextLabel.percent_visible = 0
			var tween_duracion = text_speed * dialogo[dialogo_index].length()
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, tween_duracion,
				Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
			)
			$Tween.start()
		dialogo_index += 1
 



func _on_TextureButton_pressed():
	get_tree().change_scene("res://clue_juego.tscn")
	pass # Replace with function body.
