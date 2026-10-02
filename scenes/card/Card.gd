extends TextureButton

signal carta_clicada(carta)

enum EstadoCarta{ESCONDIDA, VIRADA, RESOLVIDA}

var estado: EstadoCarta=EstadoCarta.ESCONDIDA
@export var valor: int

@onready var textura: TextureRect = $TexturaFrente

func _ready():
	_atualizar_visual()

func _pressed():
	if estado!=EstadoCarta.ESCONDIDA:
		return
	virar()
	emit_signal("carta_clicada", self)

func virar():
	estado = EstadoCarta.VIRADA
	_atualizar_visual()

func esconder():
	estado = EstadoCarta.ESCONDIDA
	_atualizar_visual()

func resolver():
	estado= EstadoCarta.RESOLVIDA
	_atualizar_visual()

func _atualizar_visual():
	match estado:
		EstadoCarta.ESCONDIDA:
			textura.visible = false
		EstadoCarta.VIRADA, EstadoCarta.RESOLVIDA:
			textura.visible = true
			textura.texture=load("res://assets/images/ec80cfd399bdcbb6f700ff622346447d.jpg")
