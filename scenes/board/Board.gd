extends Node2D

# Precarregue a cena da carta individual
const CARD_SCENE = preload("res://scenes/card/card.tscn") # Ajuste o caminho se necessário

@onready var grid_container = $GridContainer # Ou o nome do seu nó GridContainer
@onready var dados_mulheres = preload("res://data/Dados_Mulheres.gd").new() # Ou via Autoload

var cartas_viradas: Array = [] # Armazena até 2 cartas selecionadas pelo jogador
var pode_clicar: bool = false   # Bloqueia cliques durante o início e checagens

func _ready() -> void:
	iniciar_jogo()

func iniciar_jogo() -> void:
	pode_clicar = false
	
	# 1. Gerar 18 pares (36 cartas no total para a grade 6x6)
	var quantidade_de_pares = 18
	var valores_sorteados = gerar_valores(quantidade_de_pares)
	
	# 2. Instanciar e adicionar as cartas ao GridContainer
	for id_carta in valores_sorteados:
		var nova_carta = CARD_SCENE.instantiate()
		grid_container.add_child(nova_carta)
		
		# Define a ID e a imagem da carta com base nos dados
		var dados = dados_mulheres.mulheres[id_carta]
		nova_carta.definir_dados(id_carta, dados["imagem"])
		
		# Conecta o sinal de clique da carta ao método do Tabuleiro
		nova_carta.carta_clicada.connect(_on_carta_clicada)
		
		# Mostra a carta virada para cima inicialmente
		nova_carta.virar_para_cima()

	# 3. Espera 5 segundos com todas as cartas reveladas
	await get_tree().create_timer(5.0).timeout
	
	# 4. Vira todas as cartas para baixo e libera os cliques do jogador
	for carta in grid_container.get_children():
		carta.virar_para_baixo()
		
	pode_clicar = true

# Gera o array com pares duplicados e embaralhados
func gerar_valores(quantidade_de_pares: int) -> Array:
	var valores = []
	for i in range(quantidade_de_pares):
		valores.append(i)
		valores.append(i)
	valores.shuffle()
	return valores

# Chamado sempre que o jogador clica em uma carta
func _on_carta_clicada(carta_selecionada) -> void:
	# Ignora cliques se o jogo estiver bloqueado ou se a carta já estiver virada/combinada
	if not pode_clicar or carta_selecionada in cartas_viradas or carta_selecionada.ja_combinada:
		return
	
	carta_selecionada.virar_para_cima()
	cartas_viradas.append(carta_selecionada)
	
	# Se virou 2 cartas, verifica se são iguais
	if cartas_viradas.size() == 2:
		checar_par()

func checar_par() -> void:
	pode_clicar = false # Bloqueia novos cliques durante a validação
	
	var carta1 = cartas_viradas[0]
	var carta2 = cartas_viradas[1]
	
	if carta1.id_carta == carta2.id_carta:
		# ACERTO: Mantém viradas para cima e marca como combinadas
		carta1.ja_combinada = true
		carta2.ja_combinada = true
		cartas_viradas.clear()
		pode_clicar = true
	else:
		# ERRO: Espera 1 segundo para o jogador memorizar e vira de volta
		await get_tree().create_timer(1.0).timeout
		carta1.virar_para_baixo()
		carta2.virar_para_baixo()
		cartas_viradas.clear()
		pode_clicar = true
