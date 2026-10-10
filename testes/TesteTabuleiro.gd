extends Control
# Tabuleiro de TESTE: valida as cartas de figura (fase 1) e de resumo (fase 2),
# sem depender do Board.gd da equipe.
# Cena: Control (este script) > GridContainer chamado "Grid" com columns = 3

const CARD_SCENE = preload("res://scenes/card/Card.tscn")           # Ajuste o caminho se necessário
const RESUME_CARD_SCENE = preload("res://scenes/card/ResumeCard.tscn") # Ajuste o caminho se necessário

# Arraste 3 imagens aqui pelo Inspetor (cada uma vira um par na fase 1 e uma figura na fase 2)
@export var imagens: Array[Texture2D] = []
# Opcional: um resumo por imagem. Se ficar vazio, o teste gera textos automáticos.
@export var resumos: Array[String] = []

@onready var grid: GridContainer = $Grid

var fase: int = 1
var cartas_viradas: Array = []
var pode_clicar: bool = true
var pares_restantes: int = 0


func _ready() -> void:
	if imagens.is_empty():
		push_warning("Arraste 3 imagens para 'Imagens' no Inspetor.")
		return
	iniciar_fase(1)


func iniciar_fase(numero: int) -> void:
	fase = numero
	pode_clicar = true
	cartas_viradas.clear()

	# Limpa as cartas da fase anterior
	for filho in grid.get_children():
		grid.remove_child(filho)
		filho.queue_free()

	# Monta a lista do que será criado: {id, tipo}
	var itens: Array = []
	for id in imagens.size():
		if fase == 1:
			itens.append({"id": id, "tipo": "figura"})
			itens.append({"id": id, "tipo": "figura"})
		else:
			itens.append({"id": id, "tipo": "figura"})
			itens.append({"id": id, "tipo": "resumo"})
	itens.shuffle()

	pares_restantes = imagens.size()
	print("===== FASE ", fase, " (", itens.size(), " cartas, ", pares_restantes, " pares) =====")

	for item in itens:
		var carta
		if item["tipo"] == "figura":
			carta = CARD_SCENE.instantiate()
			grid.add_child(carta)
			carta.definir_dados(item["id"], imagens[item["id"]])
		else:
			carta = RESUME_CARD_SCENE.instantiate()
			grid.add_child(carta)
			carta.definir_dados(item["id"], _texto_resumo(item["id"]))
		carta.carta_clicada.connect(_on_carta_clicada)
		print("carta criada: tipo=", item["tipo"], " valor=", item["id"])


func _texto_resumo(id: int) -> String:
	if id < resumos.size() and resumos[id] != "":
		return resumos[id]
	return "Resumo de teste da carta %d" % id


func _on_carta_clicada(carta) -> void:
	print("clique: valor=", carta.valor, " estado=", carta.estado, " pode_clicar=", pode_clicar)

	# A carta já se virou sozinha; se o jogo está bloqueado, desfaz
	if not pode_clicar:
		carta.esconder()
		return
	if carta in cartas_viradas:
		return

	cartas_viradas.append(carta)
	if cartas_viradas.size() == 2:
		_checar_par()


func _checar_par() -> void:
	pode_clicar = false
	var c1 = cartas_viradas[0]
	var c2 = cartas_viradas[1]

	if c1.valor == c2.valor:
		print(">>> ACERTO (valor ", c1.valor, ")")
		c1.resolver()
		c2.resolver()
		pares_restantes -= 1
	else:
		print(">>> ERRO")
		await get_tree().create_timer(1.0).timeout
		c1.esconder()
		c2.esconder()

	cartas_viradas.clear()
	pode_clicar = true

	if pares_restantes == 0:
		_fim_da_fase()


func _fim_da_fase() -> void:
	pode_clicar = false
	print("Fase ", fase, " concluída!")
	await get_tree().create_timer(1.5).timeout
	if fase == 1:
		iniciar_fase(2)
	else:
		print("===== TESTE COMPLETO =====")
