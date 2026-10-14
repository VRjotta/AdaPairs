extends Control

# ==============================================================================
# 1. EXPORTS (Arraste os nós pelo Inspetor)
# ==============================================================================
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
## O nó que agrupa a imagem menor e as opções
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
## O vídeo .ogv que toca ao clicar em Configurações
@export var video_config: VideoStream
@export var video_1p: VideoStream
@export var video_2p: VideoStream
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


# ==============================================================================
# 2. INICIALIZAÇÃO (_ready)
# ==============================================================================
func _ready() -> void:
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	if video_player:
		video_player.visible = false

	# Conexões da Tela Inicial
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)
	if botao_configuracoes:
		botao_configuracoes.pressed.connect(_ao_carregar_configuracoes)
	if botao_voltar_selecao:
		botao_voltar_selecao.pressed.connect(_voltar_ao_menu_inicial)
	if botao_voltar_config:
		botao_voltar_config.pressed.connect(_voltar_ao_menu_inicial)

	# Conexões de 1P e 2P
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

	# Conexões das Abas de Configuração
	if botao_aba_audio:
		botao_aba_audio.pressed.connect(_mostrar_aba_audio)
	if botao_aba_idioma:
		botao_aba_idioma.pressed.connect(_mostrar_aba_idioma)

	# Slider de Volume
	if slider_volume:
		var bus_idx = AudioServer.get_bus_index("Master")
		slider_volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_idx))
		slider_volume.value_changed.connect(_ao_mudar_volume)

	# Idiomas
	if botao_idioma_pt:
		botao_idioma_pt.pressed.connect(func(): _trocar_idioma("pt_BR"))
	if botao_idioma_en:
		botao_idioma_en.pressed.connect(func(): _trocar_idioma("en"))
	if botao_idioma_es:
		botao_idioma_es.pressed.connect(func(): _trocar_idioma("es"))

	_voltar_ao_menu_inicial()


# ==============================================================================
# 3. FUNÇÕES DE NAVEGAÇÃO ENTRE TELAS
# ==============================================================================

#  COMO DEVE FICAR (mantém o fundo visível):
func _ao_carregar_configuracoes() -> void:
	# 1. Esconde os botões para não clicar duas vezes
	if botao_jogar: botao_jogar.visible = false
	if botao_configuracoes: botao_configuracoes.visible = false

	# Garante que o fundo continue visível
	

	# 2. Toca o vídeo de transição
	if video_player and video_config:
		video_player.stream = video_config
		video_player.visible = true
		video_player.play()
		await video_player.finished
		video_player.visible = false # Esconde o vídeo após terminar

	# 3. Abre a janela de configurações na frente
	if painel_configuracoes:
		painel_configuracoes.visible = true
		_mostrar_aba_audio()


func _voltar_ao_menu_inicial() -> void:
	# Esconde qualquer painel aberto na frente do fundo
	if painel_selecao: painel_selecao.visible = false
	if painel_configuracoes: painel_configuracoes.visible = false
	if silhueta_1p: silhueta_1p.visible = false
	if silhueta_2p: silhueta_2p.visible = false

	if video_player:
		video_player.stop()
		video_player.visible = false

	# Mostra os botões principais novamente
	if botao_jogar: botao_jogar.visible = true
	if botao_configuracoes: botao_configuracoes.visible = true


func _ao_carregar_jogar() -> void:
	if botao_jogar: botao_jogar.visible = false
	if botao_configuracoes: botao_configuracoes.visible = false
	if painel_selecao: painel_selecao.visible = true


# ==============================================================================
# 4. FUNÇÕES INTERNAS DE ÁUDIO E IDIOMA
# ==============================================================================

func _mostrar_aba_audio() -> void:
	if aba_audio: aba_audio.visible = true
	if aba_idioma: aba_idioma.visible = false

func _mostrar_aba_idioma() -> void:
	if aba_audio: aba_audio.visible = false
	if aba_idioma: aba_idioma.visible = true

func _ao_mudar_volume(valor: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(valor))
	AudioServer.set_bus_mute(bus_idx, valor == 0.0)

func _trocar_idioma(locale: String) -> void:
	TranslationServer.set_locale(locale)


# ==============================================================================
# 5. TRANSIÇÃO DO TABULEIRO
# ==============================================================================

func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if painel_selecao: painel_selecao.visible = false

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

	get_tree().change_scene_to_file(caminho_tabuleiro)
