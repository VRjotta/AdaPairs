extends Control

# ==============================================================================
# EXPORTS: Configure no Inspetor
# ==============================================================================
@export_group("Botões Principais")
@export var botao_jogar: BaseButton
@export var botao_voltar: BaseButton

@export_group("Fundo")
@export var imagem_fundo: CanvasItem
@export var textura_fundo_inicial: Texture2D

@export_group("Seleção de Jogadores")
@export var painel_selecao: Control
@export var botao_1p: BaseButton
@export var silhueta_1p: CanvasItem
@export var botao_2p: BaseButton
@export var silhueta_2p: CanvasItem

@export_group("Vídeos de Transição")
## O nó VideoStreamPlayer na árvore
@export var video_player: VideoStreamPlayer
## O arquivo .ogv do vídeo de 1 Player
@export var video_1p: VideoStream
## O arquivo .ogv do vídeo de 2 Players
@export var video_2p: VideoStream

@export_group("Transição Final")
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	if video_player:
		video_player.visible = false

	# Conexões dos botões
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	if botao_2p:
		if silhueta_2p:
			botao_2p.mouse_entered.connect(func(): silhueta_2p.visible = true)
			botao_2p.mouse_exited.connect(func(): silhueta_2p.visible = false)
		botao_2p.pressed.connect(_ao_escolher_modo.bind(2))

	_voltar_ao_menu_inicial()


func _ao_carregar_jogar() -> void:
	if botao_jogar:
		botao_jogar.visible = false
	if painel_selecao:
		painel_selecao.visible = true
	if botao_voltar:
		botao_voltar.visible = true
	if silhueta_1p:
		silhueta_1p.visible = false
	if silhueta_2p:
		silhueta_2p.visible = false


func _voltar_ao_menu_inicial() -> void:
	if painel_selecao:
		painel_selecao.visible = false
	if botao_voltar:
		botao_voltar.visible = false
	if silhueta_1p:
		silhueta_1p.visible = false
	if silhueta_2p:
		silhueta_2p.visible = false
	if video_player:
		video_player.stop()
		video_player.visible = false

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial
			imagem_fundo.visible = true

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	# 1. Bloqueia cliques para o jogador não apertar nada durante o vídeo
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	# 2. Esconde o painel de seleção e o botão voltar para a tela ficar limpa
	if painel_selecao: painel_selecao.visible = false
	if botao_voltar: botao_voltar.visible = false

	# 3. Toca o vídeo correspondente
	if video_player:
		var stream_escolhido: VideoStream = video_1p if jogadores == 1 else video_2p
		
		if stream_escolhido:
			video_player.stream = stream_escolhido
			video_player.visible = true
			
			# Opcional: esconde o fundo enquanto o vídeo roda
			if imagem_fundo:
				imagem_fundo.visible = false
				
			video_player.play()
			
			# Aguarda o vídeo terminar completamente
			await video_player.finished

	# 4. Transição de fade para o tabuleiro
	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
