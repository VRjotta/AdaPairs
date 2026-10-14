extends Button

@export var imagem_display: TextureRect
@export var textura_ligada: Texture2D
@export var textura_desligada: Texture2D

var esta_ligada: bool = false

func _on_pressed() -> void:
	# Inverte o estado atual (se for falso passa a verdadeiro, e vice-versa)
	esta_ligada = !esta_ligada
	
	if esta_ligada:
		imagem_display.texture = textura_ligada
	else:
		imagem_display.texture = textura_desligada
