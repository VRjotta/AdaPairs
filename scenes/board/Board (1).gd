extends Control

# Sinais para o gerenciador de partida (turnos e pontuação)
signal par_acertado(valor)
signal par_errado
signal fase_terminada(fase)

# Cenas das cartas
const CARD_SCENE = preload("res://scenes/card/Card.tscn")               # Ajuste o caminho se necessário
const RESUME_CARD_SCENE = preload("res://scenes/card/ResumeCard.tscn")  # Ajuste o caminho se necessário

@export var quantidade_de_pares: int = 18        # 18 pares = 36 cartas (grade 6x6)
@export var tempo_memorizacao_fase1: float = 5.0 # segundos com as cartas reveladas no começo da fase 1
@export var tempo_memorizacao_fase2: float = 0.0 # 0 = a fase 2 já começa com as cartas escondidas
@export var tempo_erro: float = 1.0              # segundos para o jogador ver o par errado
# Se true, o tabuleiro passa sozinho da fase 1 para a 2 (útil para testar sem o GameManager).
# Quando houver GameManager, desligue e chame iniciar_fase(2) a partir dele.
@export var modo_autonomo: bool = true

@onready var grid_container = $GridContainerCerto # Ou o nome do seu nó GridContainer
@onready var dados_mulheres = preload("res://data/Dados_Mulheres.gd").new() # Ou via Autoload

var fase: int = 1
var cartas_viradas: Array = [] # Armazena até 2 cartas selecionadas pelo jogador
var pode_clicar: bool = false  # Bloqueia cliques durante o início e as checagens
var pares_restantes: int = 0


func _ready() -> void:
	iniciar_fase(1)


# Monta e inicia uma fase. Pode ser chamada pelo GameManager.
func iniciar_fase(numero: int) -> void:
	fase = numero
	pode_clicar = false
	cartas_viradas.clear()
	pares_restantes = quantidade_de_pares

	# Limpa as cartas da fase anterior
	for filho in grid_container.get_children():
		grid_container.remove_child(filho)
		filho.queue_free()

	# 1. Gera a lista de cartas a criar: {id, tipo}
	var itens: Array = _gerar_itens(fase)

	# 2. Instancia e adiciona as cartas ao GridContainer
	for item in itens:
		var id_carta: int = item["id"]
		var dados = dados_mulheres.mulheres[id_carta]
		var nova_carta

		if item["tipo"] == "figura":
			nova_carta = CARD_SCENE.instantiate()
			grid_container.add_child(nova_carta)
			nova_carta.definir_dados(id_carta, dados["imagem"])
		else:
			nova_carta = RESUME_CARD_SCENE.instantiate()
			grid_container.add_child(nova_carta)
			nova_carta.definir_dados(id_carta, dados.get("resumo", ""))

		# Conecta o sinal de clique da carta ao método do tabuleiro
		nova_carta.carta_clicada.connect(_on_carta_clicada)

	# 3. Fase de memorização: revela tudo, espera e esconde
	var tempo = tempo_memorizacao_fase1 if fase == 1 else tempo_memorizacao_fase2
	if tempo > 0.0:
		for carta in grid_container.get_children():
			carta.virar()
		await get_tree().create_timer(tempo).timeout
		for carta in grid_container.get_children():
			carta.esconder()

	pode_clicar = true


# Fase 1: dois exemplares de figura por id.
# Fase 2: uma figura e um resumo por id.
func _gerar_itens(numero_fase: int) -> Array:
	var itens: Array = []
	for i in range(quantidade_de_pares):
		itens.append({"id": i, "tipo": "figura"})
		if numero_fase == 1:
			itens.append({"id": i, "tipo": "figura"})
		else:
			itens.append({"id": i, "tipo": "resumo"})
	itens.shuffle()
	return itens


# Chamado sempre que o jogador clica em uma carta.
# Atenção: a carta já se virou sozinha em _pressed() antes de emitir o sinal.
func _on_carta_clicada(carta_selecionada) -> void:
	# Se o jogo está bloqueado, desfaz a virada que a carta fez sozinha
	if not pode_clicar:
		carta_selecionada.esconder()
		return

	# Segurança: ignora a mesma carta clicada duas vezes
	if carta_selecionada in cartas_viradas:
		return

	cartas_viradas.append(carta_selecionada)

	# Se virou 2 cartas, verifica se são iguais
	if cartas_viradas.size() == 2:
		checar_par()


func checar_par() -> void:
	pode_clicar = false # Bloqueia novos cliques durante a validação

	var carta1 = cartas_viradas[0]
	var carta2 = cartas_viradas[1]

	if carta1.valor == carta2.valor:
		# ACERTO: mantém viradas e marca como resolvidas
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
		# ERRO: espera para o jogador memorizar e vira de volta
		par_errado.emit()
		await get_tree().create_timer(tempo_erro).timeout
		carta1.esconder()
		carta2.esconder()
		cartas_viradas.clear()
		pode_clicar = true


func _terminar_fase() -> void:
	pode_clicar = false
	fase_terminada.emit(fase)

	if modo_autonomo and fase == 1:
		await get_tree().create_timer(1.5).timeout
		iniciar_fase(2)
