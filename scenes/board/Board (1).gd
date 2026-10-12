extends Control

signal par_acertado(valor)
signal par_errado
signal fase_terminada(fase)

const CARD_SCENE = preload("res://scenes/card/Card.tscn")
const RESUME_CARD_PATH = "res://scenes/card/ResumeCard.tscn"

@export var quantidade_de_pares: int = 18        # 18 pares = 36 cartas
@export var colunas: int = 6
@export var tempo_memorizacao_fase1: float = 5.0
@export var tempo_memorizacao_fase2: float = 0.0
@export var tempo_erro: float = 1.0
@export var modo_autonomo: bool = true

@onready var grid_container = $CenterContainer/GridContainerCerto
@onready var dados_mulheres = preload("res://data/Dados_Mulheres.gd").new()

var resume_card_scene: PackedScene
var fase: int = 1
var cartas_viradas: Array = []
var pode_clicar: bool = false
var pares_restantes: int = 0
var _token: int = 0  # identifica a fase atual; muda a cada iniciar_fase


func _ready() -> void:
	# Só carrega o ResumeCard se ele existir (permite testar a fase 1 antes)
	if ResourceLoader.exists(RESUME_CARD_PATH):
		resume_card_scene = load(RESUME_CARD_PATH)
	grid_container.columns = colunas
	iniciar_fase(1)


func iniciar_fase(numero: int) -> void:
	_token += 1
	var meu_token := _token

	fase = numero
	pode_clicar = false
	cartas_viradas.clear()

	if numero == 2 and resume_card_scene == null:
		push_error("ResumeCard.tscn não encontrada: fase 2 indisponível.")
		return

	# Não pede mais pares do que existem nos dados
	var pares: int = mini(quantidade_de_pares, dados_mulheres.mulheres.size())
	if pares < quantidade_de_pares:
		push_warning("Só há %d mulheres nos dados (esperado %d)." % [pares, quantidade_de_pares])
	pares_restantes = pares

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

		nova_carta.carta_clicada.connect(_on_carta_clicada)

	var tempo := tempo_memorizacao_fase1 if fase == 1 else tempo_memorizacao_fase2
	if tempo > 0.0:
		for carta in grid_container.get_children():
			carta.virar()
		await get_tree().create_timer(tempo).timeout
		if meu_token != _token:
			return  # a fase foi reiniciada durante a espera
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
			return  # as cartas já foram descartadas
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
