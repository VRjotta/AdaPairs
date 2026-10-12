extends Control

@onready var label_fase = $MarginContainer/VBoxContainer/LabelFase
@onready var label_turno = $MarginContainer/VBoxContainer/LabelTurno

@onready var label_pontos_j1 = $MarginContainer/VBoxContainer/HBoxContainer/PainelJ1/LabelPontosJ1
@onready var label_pares_j1 = $MarginContainer/VBoxContainer/HBoxContainer/PainelJ1/LabelParesJ1

@onready var label_pontos_j2 = $MarginContainer/VBoxContainer/HBoxContainer/PainelJ2/LabelPontosJ2
@onready var label_pares_j2 = $MarginContainer/VBoxContainer/HBoxContainer/PainelJ2/LabelParesJ2

func _ready() -> void:
	label_fase.text = "Fase: Escolha a primeira carta"
	label_turno.text = "Vez do Jogador 1"
	atualizar_placar_j1(0, 0)
	atualizar_placar_j2(0, 0)

func _on_turno_alterado(jogador_atual: int, fase_atual: int) -> void:
	label_turno.text = "Vez do Jogador " + str(jogador_atual)
	
	if fase_atual == 0: 
		label_fase.text = "Fase: Escolha a primeira carta"
	elif fase_atual == 1: 
		label_fase.text = "Fase: Escolha a segunda carta"
	elif fase_atual == 2: 
		label_fase.text = "Fase: Verificando par..."

func _on_pontos_atualizados(pontos_j1: int, pontos_j2: int, pares_j1: int, pares_j2: int) -> void:
	atualizar_placar_j1(pontos_j1, pares_j1)
	atualizar_placar_j2(pontos_j2, pares_j2)

func atualizar_placar_j1(pontos: int, pares: int) -> void:
	label_pontos_j1.text = "Pontos: " + str(pontos)
	label_pares_j1.text = "Pares: " + str(pares)

func atualizar_placar_j2(pontos: int, pares: int) -> void:
	label_pontos_j2.text = "Pontos: " + str(pontos)
	label_pares_j2.text = "Pares: " + str(pares)

func _on_jogo_finalizado(vencedor: int, pontos_j1: int, pontos_j2: int) -> void:
	if vencedor == 0:
		label_fase.text = "Fim de Jogo! Empate!"
	else:
		label_fase.text = "Fim de Jogo! Jogador " + str(vencedor) + " venceu!"
	label_turno.text = ""
