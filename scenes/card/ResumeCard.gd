extends TextureButton

signal carta_clicada(carta)

enum EstadoCarta{ESCONDIDA, VIRADA, RESOLVIDA}

var estado: EstadoCarta=EstadoCarta.ESCONDIDA
var valor: int
var resumo: String

@onready var textura: TextureRect = $TexturaResumo
@onready var label_resumo: Label = $ResumeLabel

func _ready():
	textura.mouse_filter=Control.MOUSE_FILTER_IGNORE
	label_resumo.mouse_filter=Control.MOUSE_FILTER_IGNORE
	_atualizar_visual()

func definir_dados(id:int, texto:String, moldura: Texture2D=null)->void:
	valor=id
	resumo=texto
	if moldura != null and textura!=null:
		textura.texture=null
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
			label_resumo.visible = false
		EstadoCarta.VIRADA:
			textura.visible = true
			label_resumo.visible = true
			label_resumo.text = resumo
			textura.modulate = Color.WHITE
			label_resumo.modulate = Color.BLACK
		EstadoCarta.RESOLVIDA:
			textura.visible = true
			label_resumo.visible = true
			label_resumo.text = resumo
			textura.modulate = Color.WHITE
			label_resumo.modulate = Color.BLACK
