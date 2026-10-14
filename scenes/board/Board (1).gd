extends Control

signal par_acertado(valor)
signal par_errado
signal fase_terminada(fase)

const CARD_SCENE = preload("res://scenes/card/Card.tscn")
const RESUME_CARD_PATH = "res://scenes/card/ResumeCard.tscn"

const Slow_Music = preload("res://sounds/Música Slow AdaPairs.mp3")
const Fast_Music = preload("res://sounds/Música Fast AdaPairs.mp3")

@export var quantidade_de_pares: int = 18
@export var colunas: int = 6
@export var tempo_memorizacao_fase1: float = 5.0
@export var tempo_memorizacao_fase2: float = 0.0
@export var tempo_erro: float = 1.0
@export var modo_autonomo: bool = true

# Layout do tabuleiro
@export var espacamento: int = 4        # espaço entre as cartas (px)
@export var margem_tela: int = 24       # folga nas bordas da tela (px)
@export var proporcao_carta: float = 0.75 # largura / altura (0.75 = 3:4). Use 1.0 para cartas quadradas

@onready var grid_container = $CenterContainer/GridContainerCerto
@onready var dados_mulheres = preload("res://data/Dados_Mulheres.gd").new()
@onready var audio_player = $AudioStreamPlayer

var resume_card_scene: PackedScene
var fase: int = 1
var cartas_viradas: Array = []
var pode_clicar: bool = false
var pares_restantes: int = 0
var _token: int = 0 # identifica a fase atual; muda a cada iniciar_fase


func _ready() -> void:
	# Só carrega o ResumeCard se ele existir (permite testar a fase 1 antes)
	if ResourceLoader.exists(RESUME_CARD_PATH):
		resume_card_scene = load(RESUME_CARD_PATH)
	grid_container.columns = colunas
	iniciar_fase(1)


# Calcula o tamanho de cada carta para que todas caibam na tela
func _calcular_tamanho_carta(total_cartas: int) -> Vector2:
	var area := get_viewport_rect().size - Vector2.ONE * margem_tela * 2
	var linhas := ceili(float(total_cartas) / colunas)

	var largura := (area.x - espacamento * (colunas - 1)) / colunas
	var altura := (area.y - espacamento * (linhas - 1)) / linhas

	# Mantém a proporção e usa o menor tamanho possível nos dois sentidos
	var h := minf(altura, largura / proporcao_carta)
	return Vector2(h * proporcao_carta, h)


func iniciar_fase(numero: int) -> void:
	_token += 1
	var meu_token := _token

	fase = numero
	pode_clicar = false
	cartas_viradas.clear()

	# A fase 2 precisa da cena de resumo; se não existir, nem troca a música
	if numero == 2 and resume_card_scene == null:
		push_error("ResumeCard.tscn não encontrada: fase 2 indisponível.")
		return

	# >>> CONTROLE DA MÚSICA POR FASE <<<
	if fase == 1:
		audio_player.stream = Slow_Music
		audio_player.play()
	elif fase == 2:
		audio_player.stream = Fast_Music
		audio_player.play()

	# Não pede mais pares do que existem nos dados
	var pares: int = mini(quantidade_de_pares, dados_mulheres.mulheres.size())
	if pares < quantidade_de_pares:
		push_warning("Só há %d mulheres nos dados (esperado %d)." % [pares, quantidade_de_pares])
	pares_restantes = pares

	# Espaçamento e tamanho das cartas
	grid_container.add_theme_constant_override("h_separation", espacamento)
	grid_container.add_theme_constant_override("v_separation", espacamento)
	var tamanho_carta := _calcular_tamanho_carta(pares * 2)

	# Limpa as cartas da fase anterior
	for filho in grid_container.get_children():
		grid_container.remove_child(filho)
		filho.queue_free()

	for item in _gerar_itens(fase, pares):
		var id_carta: int = item["id"]
		var dados = dados_mulheres.mulheres[id_carta]
		var nova_carta

		if item["tipo"] == "figura":
			nova_carta = CARD_SCENE.instantiate()
			grid_container.add_child(nova_carta)
			nova_carta.definir_dados(id_carta, dados["imagem"])
		else:
			nova_carta = resume_card_scene.instantiate()
			grid_container.add_child(nova_carta)
			nova_carta.definir_dados(id_carta, dados.get("resumo", ""))

		nova_carta.custom_minimum_size = tamanho_carta
		nova_carta.carta_clicada.connect(_on_carta_clicada)

	# Espera um frame para o GridContainer definir o tamanho final das cartas.
	# Sem isso, a animação de virar usa o tamanho antigo e as cartas parecem crescer.
	await get_tree().process_frame
	if meu_token != _token:
		return

	var tempo := tempo_memorizacao_fase1 if fase == 1 else tempo_memorizacao_fase2
	if tempo > 0.0:
		for carta in grid_container.get_children():
			carta.virar()
		await get_tree().create_timer(tempo).timeout
		if meu_token != _token:
			return
		for carta in grid_container.get_children():
			carta.esconder()

	pode_clicar = true


func _gerar_itens(numero_fase: int, pares: int) -> Array:
	var itens: Array = []
	for i in range(pares):
		itens.append({"id": i, "tipo": "figura"})
		if numero_fase == 1:
			itens.append({"id": i, "tipo": "figura"})
		else:
			itens.append({"id": i, "tipo": "resumo"})
	itens.shuffle()
	return itens


func _on_carta_clicada(carta_selecionada) -> void:
	if not pode_clicar:
		carta_selecionada.esconder()
		return

	if carta_selecionada in cartas_viradas:
		return

	cartas_viradas.append(carta_selecionada)

	if cartas_viradas.size() == 2:
		checar_par()


func checar_par() -> void:
	pode_clicar = false
	var meu_token := _token

	var carta1 = cartas_viradas[0]
	var carta2 = cartas_viradas[1]

	if carta1.valor == carta2.valor:
		carta1.resolver()
		carta2.resolver()
		pares_restantes -= 1
		par_acertado.emit(carta1.valor)
		cartas_viradas.clear()

		if pares_restantes == 0:
			_terminar_fase()
		else:
			pode_clicar = true
	else:
		par_errado.emit()
		await get_tree().create_timer(tempo_erro).timeout
		if meu_token != _token:
			return
		carta1.esconder()
		carta2.esconder()
		cartas_viradas.clear()
		pode_clicar = true


func _terminar_fase() -> void:
	pode_clicar = false
	var meu_token := _token
	fase_terminada.emit(fase)

	if modo_autonomo and fase == 1:
		await get_tree().create_timer(1.5).timeout
		if meu_token != _token:
			return
		iniciar_fase(2)
