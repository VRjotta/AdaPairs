extends TextureButton

signal carta_clicada(carta)

enum EstadoCarta { ESCONDIDA, VIRADA, RESOLVIDA }

const ANIM_VIRAR := "virar" 

var estado: EstadoCarta = EstadoCarta.ESCONDIDA
@export var valor: int          # id do par
var imagem: Texture2D           # frente da carta, definida pelo tabuleiro

@onready var textura: TextureRect = $TexturaFrente
@onready var anim: AnimatedSprite2D = $Animacaovirada
@onready var card_sfx = $ShuffleCardSfx


func _ready() -> void:
	textura.mouse_filter = Control.MOUSE_FILTER_IGNORE
	anim.visible = false
	anim.animation_finished.connect(_on_animacao_terminou)
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
	if card_sfx != null:
		card_sfx.play()
	virar()
	carta_clicada.emit(self)


func virar() -> void:
	estado = EstadoCarta.VIRADA
	_animar_virada(true)


func esconder() -> void:
	estado = EstadoCarta.ESCONDIDA
	_animar_virada(false)


func resolver() -> void:
	estado = EstadoCarta.RESOLVIDA
	_atualizar_visual()  

func _animar_virada(para_cima: bool) -> void:

	if not is_inside_tree() or anim.sprite_frames == null or not anim.sprite_frames.has_animation(ANIM_VIRAR):
		_atualizar_visual()
		return

	var quadro: Texture2D = anim.sprite_frames.get_frame_texture(ANIM_VIRAR, 0)
	var tam_quadro: Vector2 = quadro.get_size()
	anim.scale = Vector2.ONE * min(size.x / tam_quadro.x, size.y / tam_quadro.y)
	anim.position = size / 2.0

	textura.visible = false
	self_modulate = Color(1, 1, 1, 0)
	anim.visible = true
	anim.stop()

	if para_cima:
		anim.frame = 0
		anim.play(ANIM_VIRAR)
	else:
		anim.frame = anim.sprite_frames.get_frame_count(ANIM_VIRAR) - 1
		anim.play_backwards(ANIM_VIRAR)


func _on_animacao_terminou() -> void:
	anim.visible = false
	self_modulate = Color.WHITE
	_atualizar_visual()


func _atualizar_visual() -> void:

	if textura == null or anim == null or anim.visible:
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
