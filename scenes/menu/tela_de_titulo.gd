

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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)tiver sido definida no Inspetor
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro) TextureRect:
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)reextends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)REextends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)al)extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro).visible = true)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)visible = false)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro))extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro).visible = true)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)visible = false)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro))extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)==========================
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)==========================extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)otão Voltar
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro) jogo)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro) TextureRect:
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)alextends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)==========================
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)==========================
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)urante a animação
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro) 0.8)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
extends Control

# ==============================================================================
# EXPORTS: Arraste os nós correspondentes no Inspetor
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

@export_group("Transição e Efeitos")
@export var anim_player: AnimationPlayer
@export var tela_fade: ColorRect
@export_file("*.tscn") var caminho_tabuleiro: String = "res://tabuleiro.tscn"


func _ready() -> void:
	# Guarda a textura inicial se não foi definida
	if imagem_fundo and not textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			textura_fundo_inicial = imagem_fundo.texture

	# Configura o fade se ele existir
	if tela_fade:
		tela_fade.visible = true
		tela_fade.modulate.a = 0.0
		tela_fade.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Conecta o botão Jogar
	if botao_jogar:
		botao_jogar.pressed.connect(_ao_carregar_jogar)

	# Conecta o botão Voltar
	if botao_voltar:
		botao_voltar.pressed.connect(_voltar_ao_menu_inicial)

	# Conecta 1 Player
	if botao_1p:
		if silhueta_1p:
			botao_1p.mouse_entered.connect(func(): silhueta_1p.visible = true)
			botao_1p.mouse_exited.connect(func(): silhueta_1p.visible = false)
		botao_1p.pressed.connect(_ao_escolher_modo.bind(1))

	# Conecta 2 Players
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

	if imagem_fundo and textura_fundo_inicial:
		if imagem_fundo is Sprite2D or imagem_fundo is TextureRect:
			imagem_fundo.texture = textura_fundo_inicial

	if botao_jogar:
		botao_jogar.visible = true


func _ao_escolher_modo(jogadores: int) -> void:
	if botao_1p: botao_1p.disabled = true
	if botao_2p: botao_2p.disabled = true
	if botao_voltar: botao_voltar.disabled = true

	if anim_player:
		var nome_anim = "animacao_1p" if jogadores == 1 else "animacao_2p"
		if anim_player.has_animation(nome_anim):
			anim_player.play(nome_anim)
			await anim_player.animation_finished

	_executar_transicao_para_tabuleiro()


func _executar_transicao_para_tabuleiro() -> void:
	if tela_fade:
		tela_fade.mouse_filter = Control.MOUSE_FILTER_STOP
		var tween = create_tween()
		tween.tween_property(tela_fade, "modulate:a", 1.0, 0.8)
		await tween.finished

	get_tree().change_scene_to_file(caminho_tabuleiro)
