extends Node

signal turno_alterado(jogador_atual, fase_atual)
signal pontos_atualizados(pontos_j1, pontos_j2, pares_j1, pares_j2)
signal jogo_finalizado(vencedor, pontos_j1, pontos_j2)

enum Fase { PRIMEIRA_CARTA, SEGUNDA_CARTA, AGUARDANDO_DESVIRAR }

var jogador_atual: int = 1
var fase_atual: Fase = Fase.PRIMEIRA_CARTA

var pontos_j1: int = 0
var pontos_j2: int = 0
var pares_j1: int = 0
var pares_j2: int = 0

var primeira_carta = null
var segunda_carta = null

func _ready() -> void:
	atualizar_interface()

func registrar_clique_carta(carta) -> void:
	if fase_atual == Fase.AGUARDANDO_DESVIRAR:
		return
		
	if fase_atual == Fase.PRIMEIRA_CARTA:
		primeira_carta = carta
		fase_atual = Fase.SEGUNDA_CARTA
		emit_signal("turno_alterado", jogador_atual, fase_atual)
		
	elif fase_atual == Fase.SEGUNDA_CARTA:
		if carta == primeira_carta:
			return
			
		segunda_carta = carta
		fase_atual = Fase.AGUARDANDO_DESVIRAR
		emit_signal("turno_alterado", jogador_atual, fase_atual)
		
		_verificar_par()

func _verificar_par() -> void:
	if primeira_carta == null or segunda_carta == null:
		return

	if primeira_carta.id == segunda_carta.id:
		_processar_acerto()
	else:
		_processar_erro()

func _processar_acerto() -> void:
	if jogador_atual == 1:
		pontos_j1 += 10
		pares_j1 += 1
	else:
		pontos_j2 += 10
		pares_j2 += 1
		
	atualizar_interface()
	
	primeira_carta.desativar_carta()
	segunda_carta.desativar_carta()
	
	_limpar_cartas_selecionadas()
	fase_atual = Fase.PRIMEIRA_CARTA
	emit_signal("turno_alterado", jogador_atual, fase_atual)

func _processar_erro() -> void:
	var timer = get_tree().create_timer(1.2)
	await timer.timeout
	
	if primeira_carta and is_instance_valid(primeira_carta):
		primeira_carta.desvirar()
	if segunda_carta and is_instance_valid(segunda_carta):
		segunda_carta.desvirar()
		
	_limpar_cartas_selecionadas()
	
	jogador_atual = 2 if jogador_atual == 1 else 1
	fase_atual = Fase.PRIMEIRA_CARTA
	
	atualizar_interface()
	emit_signal("turno_alterado", jogador_atual, fase_atual)

func _limpar_cartas_selecionadas() -> void:
	primeira_carta = null
	segunda_carta = null

func atualizar_interface() -> void:
	emit_signal("pontos_atualizados", pontos_j1, pontos_j2, pares_j1, pares_j2)

func verificar_fim_de_jogo(total_pares_no_tabuleiro: int) -> void:
	if (pares_j1 + pares_j2) >= total_pares_no_tabuleiro:
		var vencedor = 0
		if pontos_j1 > pontos_j2:
			vencedor = 1
		elif pontos_j2 > pontos_j1:
			vencedor = 2
		else:
			vencedor = 0
			
		emit_signal("jogo_finalizado", vencedor, pontos_j1, pontos_j2)
