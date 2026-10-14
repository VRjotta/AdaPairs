extends TextureButton

signal carta_clicada(carta)

enum EstadoCarta { ESCONDIDA, VIRADA, RESOLVIDA }

var estado: EstadoCarta = EstadoCarta.ESCONDIDA
@export var valor: int          #id do par
var imagem: Texture2D           #frente da carta, definida pelo tabuleiro

@onready var textura: TextureRect = $TexturaFrente
@onready var card_sfx = $ShuffleCardSfx

func _ready() -> void:
	textura.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_atualizar_visual()

func definir_dados(id: int, img) -> void:
	valor = id
	if img is String:
		imagem = load(img)
	elif img is Texture2D:
		imagem = img
	_atualizar_visual()

func _pressed() -> void:
	if estado != EstadoCarta.ESCONDIDA:
		return
	virar()
	carta_clicada.emit(self)

func virar() -> void:
	estado = EstadoCarta.VIRADA
	_atualizar_visual()
	card_sfx.play()

func esconder() -> void:
	estado = EstadoCarta.ESCONDIDA
	_atualizar_visual()

func resolver() -> void:
	estado = EstadoCarta.RESOLVIDA
	_atualizar_visual()

func _atualizar_visual() -> void:
	if textura == null:
		return
	match estado:
		EstadoCarta.ESCONDIDA:
			textura.visible = false
		EstadoCarta.VIRADA:
			textura.texture = imagem
			textura.visible = true
			textura.modulate = Color.WHITE
		EstadoCarta.RESOLVIDA:
			textura.texture = imagem
			textura.visible = true
			textura.modulate = Color(1, 1, 1, 0.6)
