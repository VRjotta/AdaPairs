extends TextureButton

signal carta_clicada(carta)

enum EstadoCarta{ESCONDIDA, VIRADA, RESOLVIDA}

var estado: EstadoCarta=EstadoCarta.ESCONDIDA
var valor: int

@onready var label_resumo: Label = $ResumeLabel

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
			label_resumo.visible = false
		EstadoCarta.VIRADA, EstadoCarta.RESOLVIDA:
			label_resumo.visible = true
			label_resumo.text="No alto daquele cume, eu plantei uma roseira..."
