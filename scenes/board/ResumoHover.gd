extends CanvasLayer
# Balão que mostra o nome e o resumo de uma mulher quando o mouse passa sobre uma carta resolvida.
# Uso (no Board.gd):
#   resumo_hover.mostrar(carta, nome, resumo)
#   resumo_hover.esconder(carta)   # ou esconder() sem argumento para fechar sempre

@export var largura: float = 320.0   # largura do balão (px)
@export var margem: float = 12.0     # distância entre a carta e o balão (px)
@export var tamanho_nome: int = 24
@export var tamanho_texto: int = 19

# Fonte de leitura fácil (a mesma do placar). Troque por outra, se preferir.
const FONT_TEXTO_PATH = "res://assets/fontes/Fredoka-Bold.ttf"

var _painel: PanelContainer
var _nome: Label
var _texto: Label
var _carta_atual: Control = null


func _ready() -> void:
	layer = 10  # sempre acima do tabuleiro e do placar

	_painel = PanelContainer.new()
	_painel.mouse_filter = Control.MOUSE_FILTER_IGNORE  # o balão nunca bloqueia cliques
	_painel.visible = false

	var estilo := StyleBoxFlat.new()
	estilo.bg_color = Color("f3e9d2")        # creme, como as fitas do menu
	estilo.border_color = Color("5a3a1e")    # marrom escuro
	estilo.set_border_width_all(3)
	estilo.set_corner_radius_all(10)
	estilo.set_content_margin_all(14)
	estilo.shadow_color = Color(0, 0, 0, 0.35)
	estilo.shadow_size = 6
	_painel.add_theme_stylebox_override("panel", estilo)

	var caixa := VBoxContainer.new()
	caixa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caixa.add_theme_constant_override("separation", 6)
	_painel.add_child(caixa)

	_nome = Label.new()
	_nome.custom_minimum_size.x = largura
	_nome.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_nome.add_theme_color_override("font_color", Color("8a6420"))  # dourado escuro
	_nome.add_theme_font_size_override("font_size", tamanho_nome)
	caixa.add_child(_nome)

	_texto = Label.new()
	_texto.custom_minimum_size.x = largura
	_texto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_texto.add_theme_color_override("font_color", Color("3b2a1a"))
	_texto.add_theme_font_size_override("font_size", tamanho_texto)
	caixa.add_child(_texto)

	# Sem isso, o balão herdaria a fonte cursiva padrão do projeto, difícil de ler em texto longo
	if ResourceLoader.exists(FONT_TEXTO_PATH):
		var fonte = load(FONT_TEXTO_PATH)
		_nome.add_theme_font_override("font", fonte)
		_texto.add_theme_font_override("font", fonte)

	add_child(_painel)


func mostrar(carta: Control, nome: String, resumo: String) -> void:
	_carta_atual = carta
	_nome.text = nome
	_texto.text = resumo

	# Encolhe o painel e espera um frame para ele recalcular o tamanho com o texto novo
	_painel.size = Vector2.ZERO
	_painel.modulate.a = 0.0
	_painel.visible = true
	await get_tree().process_frame

	# O mouse pode ter saído da carta (ou a carta sumido) durante a espera
	if not is_instance_valid(carta) or _carta_atual != carta:
		return

	_posicionar(carta)
	var tween := create_tween()
	tween.tween_property(_painel, "modulate:a", 1.0, 0.12)


func esconder(carta: Control = null) -> void:
	# Se passou uma carta, só esconde se o balão for dela (evita fechar o balão de outra carta)
	if carta != null and carta != _carta_atual:
		return
	_carta_atual = null
	_painel.visible = false


func _posicionar(carta: Control) -> void:
	var r := carta.get_global_rect()
	var tam := _painel.size
	var tela := get_viewport().get_visible_rect().size

	# Prefere o lado direito da carta; se não couber, vai para o esquerdo
	var pos := Vector2(r.end.x + margem, r.position.y)
	if pos.x + tam.x > tela.x - margem:
		pos.x = r.position.x - tam.x - margem

	pos.x = clampf(pos.x, margem, maxf(margem, tela.x - tam.x - margem))
	pos.y = clampf(pos.y, margem, maxf(margem, tela.y - tam.y - margem))
	_painel.position = pos
