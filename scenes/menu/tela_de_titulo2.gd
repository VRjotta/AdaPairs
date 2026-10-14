extends Control

# ==============================================================================
# 1. EXPORTS (Arraste os nós correspondentes pelo Inspetor)
# ==============================================================================
@export_group("Fundo")
@export var imagem_fundo: CanvasItem
## Arraste aqui a imagem com a luz desligada (PNG original)
@export var textura_luz_desligada: Texture2D

@export_group("Áudio dos Menus")
## Som padrão para botões comuns (Jogar, 1P, 2P, Configurações, Abas, Idiomas)
@export var som_clique: AudioStreamPlayer
## Som exclusivo dos botões de Voltar
@export var som_voltar: AudioStreamPlayer

@export_group("Botões da Tela Inicial")
@export var botao_jogar: BaseButton
@export var botao_configuracoes: BaseButton

@export_group("Painel de Seleção (1P / 2P)")
@export var painel_selecao: Control
@export var botao_voltar_selecao: BaseButton
@export var botao_1p: BaseButton
@export var silhueta_1p: CanvasItem
@export var botao_2p: BaseButton
@export var silhueta_2p: CanvasItem

@export_group("Painel de Configurações")
@export var painel_configuracoes: Control
@export var botao_voltar_config: BaseButton
@export var botao_aba_audio: BaseButton
@export var botao_aba_idioma: BaseButton
@export var aba_audio: Control
@export var aba_idioma: Control
@export var slider_volume: HSlider
@export var botao_idioma_pt: BaseButton
@export var botao_idioma_en: BaseButton
@export var botao_idioma_es: BaseButton

@export_group("Vídeos e Transições")
@export var video_player: VideoStreamPlayer
@export var video_config: VideoStream
@export var video_1p: VideoStream
@export var video_2p: VideoStream
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


# ==============================================================================
# 2. INICIALIZAÇÃO (_ready)
# ==============================================================================
func _ready() -> void:
	# Configuração inicial da tela de fade
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	if video_player:
		video_player.visible = false

	# Conexões dos botões da tela inicial
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)
	if botao_configuracoes:
		botao_configuracoes.pressed.connect(_ao_carregar_configuracoes)

	# Conexões dos botões de voltar
	if botao_voltar_selecao:
		botao_voltar_selecao.pressed.connect(_voltar_ao_menu_inicial)
	if botao_voltar_config:
		botao_voltar_config.pressed.connect(_voltar_ao_menu_inicial)

	# Conexões da seleção 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conexões da seleção 2 Players
	if botao_2p:
		if silhueta_2p:
			botao_2p.mouse_entered.connect(func(): silhueta_2p.visible = true)
			botao_2p.mouse_exited.connect(func(): silhueta_2p.visible = false)
		botao_2p.pressed.connect(_ao_escolher_modo.bind(2))

	# Abas do menu de configurações
	if botao_aba_audio:
		botao_aba_audio.pressed.connect(_mostrar_aba_audio)
	if botao_aba_idioma:
		botao_aba_idioma.pressed.connect(_mostrar_aba_idioma)

	# Controle de volume do AudioServer
	if slider_volume:
		var bus_idx = AudioServer.get_bus_index("Master")
		slider_volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_idx))
		slider_volume.value_changed.connect(_ao_mudar_volume)

	# Botões de idioma
	if botao_idioma_pt:
		botao_idioma_pt.pressed.connect(func(): _trocar_idioma("pt_BR"))
	if botao_idioma_en:
		botao_idioma_en.pressed.connect(func(): _trocar_idioma("en"))
	if botao_idioma_es:
		botao_idioma_es.pressed.connect(func(): _trocar_idioma("es"))

	_voltar_ao_menu_inicial()
	# Conecta os sons automaticamente
	_conectar_sons_nos_botoes(self)


# ==============================================================================
# 3. NAVEGAÇÃO ENTRE TELAS
# ==============================================================================

func _ao_carregar_jogar() -> void:
	# Oculta os botões principais
	if botao_jogar:
		botao_jogar.visible = false
	if botao_configuracoes:
		botao_configuracoes.visible = false

	# Abre o painel com 1P e 2P e o botão voltar
	if painel_selecao:
		painel_selecao.visible = true
	if botao_voltar_selecao:
		botao_voltar_selecao.visible = true


func _ao_carregar_configuracoes() -> void:
	if botao_jogar:
		botao_jogar.visible = false
	if botao_configuracoes:
		botao_configuracoes.visible = false

	# Toca o vídeo da transição
	if video_player and video_config:
		video_player.stream = video_config
		video_player.visible = true
		video_player.play()
		await video_player.finished
		video_player.visible = false

	# Garante o fundo visível e exibe o painel de configurações na frente
	if imagem_fundo:
		imagem_fundo.visible = true
	if painel_configuracoes:
		painel_configuracoes.visible = true
		_mostrar_aba_audio()
	if botao_voltar_config:
		botao_voltar_config.visible = true


func _voltar_ao_menu_inicial() -> void:
	# 1. Toca o som do botão de voltar (se configurado)
	if som_voltar:
		som_voltar.play()

	# 2. REPÕE A TEXTURA DA LUZ DESLIGADA
	if imagem_fundo and textura_luz_desligada:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_luz_desligada
		imagem_fundo.visible = true

	# 3. Oculta todos os painéis e elementos secundários
	if painel_selecao:
		painel_selecao.visible = false
	if painel_configuracoes:
		painel_configuracoes.visible = false
	if botao_voltar_selecao:
		botao_voltar_selecao.visible = false
	if botao_voltar_config:
		botao_voltar_config.visible = false
	if silhueta_1p:
		silhueta_1p.visible = false
	if silhueta_2p:
		silhueta_2p.visible = false

	if video_player:
		video_player.stop()
		video_player.visible = false

	# 4. Restaura os botões de início
	if botao_jogar:
		botao_jogar.visible = true
	if botao_configuracoes:
		botao_configuracoes.visible = true


# ==============================================================================
# 4. CONFIGURAÇÕES: ÁUDIO E IDIOMA
# ==============================================================================

func _mostrar_aba_audio() -> void:
	if aba_audio:
		aba_audio.visible = true
	if aba_idioma:
		aba_idioma.visible = false


func _mostrar_aba_idioma() -> void:
	if aba_audio:
		aba_audio.visible = false
	if aba_idioma:
		aba_idioma.visible = true


func _ao_mudar_volume(valor: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(valor))
	AudioServer.set_bus_mute(bus_idx, valor == 0.0)


func _trocar_idioma(locale: String) -> void:
	TranslationServer.set_locale(locale)


# ==============================================================================
# 5. TRANSIÇÃO PARA O TABULEIRO
# ==============================================================================

func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p:
		botao_1p.disabled = true
	if botao_2p:
		botao_2p.disabled = true
	if botao_voltar_selecao:
		botao_voltar_selecao.visible = false
	if painel_selecao:
		painel_selecao.visible = false

	if video_player:
		var stream_escolhido: VideoStream = video_1p if jogadores == 1 else video_2p
		if stream_escolhido:
			video_player.stream = stream_escolhido
			video_player.visible = true
			video_player.play()
			await video_player.finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file("res://scenes/board/Board.tscn")

# ==============================================================================
# FUNÇÕES DE ÁUDIO DOS BOTÕES
# ==============================================================================

# Varre todos os nós filhos e conecta o clique ao som correspondente
func _conectar_sons_nos_botoes(no_atual: Node) -> void:
	for filho in no_atual.get_children():
		if filho is BaseButton:
			# Se for um dos botões de voltar, toca o som exclusivo de voltar
			if filho == botao_voltar_selecao or filho == botao_voltar_config:
				filho.pressed.connect(_tocar_som_voltar)
			# Todos os outros botões usam o clique padrão
			else:
				filho.pressed.connect(_tocar_som_clique)
		
		# Procura nós dentro de painéis e containers filhos
		if filho.get_child_count() > 0:
			_conectar_sons_nos_botoes(filho)

func _tocar_som_clique() -> void:
	if som_clique:
		som_clique.play()

func _tocar_som_voltar() -> void:
	if som_voltar:
		som_voltar.play()
