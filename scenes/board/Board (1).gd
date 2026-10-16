extends Control

signal par_acertado(valor)
signal par_errado
signal fase_terminada(fase)
signal turno_mudou(jogador)

const CARD_SCENE = preload("res://scenes/card/Card.tscn")
# FASE 2: Desativada / Comentada
# const RESUME_CARD_PATH = "res://scenes/card/ResumeCard.tscn"

const Slow_Music = preload("res://sounds/Música Slow AdaPairs.mp3")
# FASE 2: Desativada / Comentada
# const Fast_Music = preload("res://sounds/Música Fast AdaPairs.mp3")

# Fontes
const FONT_PATH = "res://assets/fontes/Always in the Star.ttf"   # vitória
const FONT_TEXTO_PATH = "res://assets/fontes/Fredoka-Bold.ttf"   # placar e turnos

# Pontuação
const PONTOS_ACERTO: int = 100
const PENALIDADE_ERRO: int = 10

# Destaque visual dos jogadores (índice 0 = Jogador 1, 1 = Jogador 2...)
const CORES_JOGADORES: Array[Color] = [
	Color("e63977"), # rosa    (Jogador 1)
	Color("2e9cdb"), # azul    (Jogador 2)
	Color("f2a900"), # amarelo (Jogador 3)
	Color("3cb371"), # verde   (Jogador 4)
]
const OPACIDADE_INATIVO: float = 0.45
const TAMANHO_ATIVO: int = 40
const TAMANHO_INATIVO: int = 30

@export var quantidade_de_pares: int = 6
@export var colunas: int = 6
@export var tempo_memorizacao_fase1: float = 5.0
# @export var tempo_memorizacao_fase2: float = 0.0 # FASE 2
@export var tempo_erro: float = 1.0
@export var modo_autonomo: bool = false 

# Layout do tabuleiro
@export var espacamento: int = 12         # espaço entre as cartas (px)
@export var margem_tela: int = 60         # folga nas bordas da tela (px)
@export var faixa_placar: int = 50        # espaço extra no topo reservado ao placar (px)
@export var proporcao_carta: float = 0.75 # largura / altura (0.75 = 3:4). Use 1.0 para cartas quadradas
@export var fator_tamanho: float = 0.8    # 1.0 = ocupa toda a área disponível; menor = cartas menores

@onready var grid_container = $CenterContainer/GridContainerCerto
@onready var dados_mulheres = preload("res://data/Dados_Mulheres.gd").new()
@onready var audio_player = $AudioStreamPlayer

# Nó opcional para exibir a mensagem de "Você ganhou!" na tela
@onready var mens_vitoria_label = $MensagemVitoria if has_node("MensagemVitoria") else null
# Nó opcional para exibir de quem é a vez (texto)
@onready var turno_label = $TurnoLabel if has_node("TurnoLabel") else null

var fase: int = 1
var cartas_viradas: Array = []
var pode_clicar: bool = false
var pares_restantes: int = 0
var pontuacoes: Array[int] = []
var jogador_atual: int = 0 # índice do jogador (0 = Jogador 1)
# Vem da escolha no menu: 1 = singleplayer, 2 a 4 = multiplayer
var num_jogadores: int = clampi(ConfigJogo.num_jogadores, 1, 4)
var placar_labels: Array = [] # um Label por jogador, criado por código
var _token: int = 0 # identifica a fase atual; muda a cada iniciar_fase


func _ready() -> void:
	if mens_vitoria_label:
		mens_vitoria_label.hide()
		
		# Configura o Label para ocupar o ecrã inteiro e centralizar o texto perfeitamente
		mens_vitoria_label.set_anchors_preset(Control.PRESET_FULL_RECT)
		mens_vitoria_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		mens_vitoria_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		
		# Carrega e aplica a fonte personalizada
		if ResourceLoader.exists(FONT_PATH):
			var custom_font = load(FONT_PATH)
			mens_vitoria_label.add_theme_font_override("font", custom_font)
		
		# Aumenta o tamanho da fonte (ajuste o valor se quiser maior ou menor)
		mens_vitoria_label.add_theme_font_size_override("font_size", 64)
		
		# Aplica a cor verde
		mens_vitoria_label.add_theme_color_override("font_color", Color.GREEN)

	# Fonte do label de turno (opcional)
	if turno_label and ResourceLoader.exists(FONT_TEXTO_PATH):
		turno_label.add_theme_font_override("font", load(FONT_TEXTO_PATH))
		turno_label.add_theme_font_size_override("font_size", 28)

	# Placar colorido (um label por jogador)
	_criar_placar()

	# Sistema de pontuação
	par_acertado.connect(_on_par_acertado)
	par_errado.connect(_on_par_errado)
		
	grid_container.columns = colunas
	iniciar_fase(1)


# Cria o placar no topo da tela, com um Label para cada jogador (1 a 4)
func _criar_placar() -> void:
	var caixa := HBoxContainer.new()
	caixa.set_anchors_and_offsets_preset(Control.PRESET_TOP_WIDE)
	caixa.offset_top = 16
	caixa.alignment = BoxContainer.ALIGNMENT_CENTER
	caixa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caixa.add_theme_constant_override("separation", 60)
	add_child(caixa)

	var fonte = load(FONT_TEXTO_PATH) if ResourceLoader.exists(FONT_TEXTO_PATH) else null

	for i in num_jogadores:
		var l := Label.new()
		if fonte:
			l.add_theme_font_override("font", fonte)
		caixa.add_child(l)
		placar_labels.append(l)


# Calcula o tamanho de cada carta para que todas caibam na tela
func _calcular_tamanho_carta(total_cartas: int) -> Vector2:
	# Reserva uma faixa extra no topo para o placar
	var area := get_viewport_rect().size - Vector2(margem_tela * 2, margem_tela * 2 + faixa_placar)
	var linhas := ceili(float(total_cartas) / colunas)

	var largura := (area.x - espacamento * (colunas - 1)) / colunas
	var altura := (area.y - espacamento * (linhas - 1)) / linhas

	# Mantém a proporção, usa o menor tamanho possível nos dois sentidos e aplica o fator
	var h := minf(altura, largura / proporcao_carta) * fator_tamanho
	return Vector2(h * proporcao_carta, h)


func iniciar_fase(numero: int) -> void:
	_token += 1
	var meu_token := _token

	fase = numero
	pode_clicar = false
	cartas_viradas.clear()

	# Zera placar e turno ao começar o jogo
	if numero == 1:
		_resetar_jogo()

	# >>> CONTROLE DA MÚSICA <<<
	if fase == 1:
		audio_player.stream = Slow_Music
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

		nova_carta.custom_minimum_size = tamanho_carta
		nova_carta.carta_clicada.connect(_on_carta_clicada)

	# Espera um frame para o GridContainer definir o tamanho final das cartas.
	await get_tree().process_frame
	if meu_token != _token:
		return

	var tempo := tempo_memorizacao_fase1
	
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
	# Sorteia quais mulheres entram nesta rodada (entre todas as do data)
	var ids: Array = range(dados_mulheres.mulheres.size())
	ids.shuffle()
	ids = ids.slice(0, pares)

	# Cria as duas cartas de cada mulher sorteada
	var itens: Array = []
	for id_mulher in ids:
		itens.append({"id": id_mulher, "tipo": "figura"})
		itens.append({"id": id_mulher, "tipo": "figura"})

	# Embaralha a posição das cartas no tabuleiro
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
		# Acertou: pontua e continua jogando (não passa a vez)
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
		# Errou: perde pontos e passa a vez depois de esconder as cartas
		par_errado.emit()
		await get_tree().create_timer(tempo_erro).timeout
		if meu_token != _token:
			return
		carta1.esconder()
		carta2.esconder()
		cartas_viradas.clear()
		_proximo_turno()
		pode_clicar = true


func _terminar_fase() -> void:
	pode_clicar = false
	fase_terminada.emit(fase)

	var texto := _texto_resultado()
	print(texto.replace("\n", " | "))
	
	if mens_vitoria_label:
		mens_vitoria_label.text = texto

		# Multiplayer: pinta com a cor do vencedor. Singleplayer ou empate: verde
		var maior: int = pontuacoes.max()
		if num_jogadores > 1 and pontuacoes.count(maior) == 1:
			var venc: int = pontuacoes.find(maior)
			mens_vitoria_label.add_theme_color_override(
				"font_color", CORES_JOGADORES[venc % CORES_JOGADORES.size()])
		else:
			mens_vitoria_label.add_theme_color_override("font_color", Color.GREEN)

		mens_vitoria_label.show()


# ---------- Turnos e pontuação ----------

func _resetar_jogo() -> void:
	pontuacoes.clear()
	for i in num_jogadores:
		pontuacoes.append(0)
	jogador_atual = 0
	_atualizar_turno_label()
	turno_mudou.emit(jogador_atual)


func _proximo_turno() -> void:
	# No singleplayer o módulo mantém sempre o jogador 0
	jogador_atual = (jogador_atual + 1) % num_jogadores
	_atualizar_turno_label()
	if num_jogadores > 1:
		_animar_destaque(jogador_atual)
	turno_mudou.emit(jogador_atual)


func _on_par_acertado(_valor) -> void:
	pontuacoes[jogador_atual] += PONTOS_ACERTO
	_atualizar_placar()


func _on_par_errado() -> void:
	pontuacoes[jogador_atual] = maxi(0, pontuacoes[jogador_atual] - PENALIDADE_ERRO)
	_atualizar_placar()


# Atualiza texto e estilo de cada jogador (o da vez fica em destaque)
func _atualizar_placar() -> void:
	for i in placar_labels.size():
		var l: Label = placar_labels[i]
		if num_jogadores == 1:
			l.text = "Pontos: %d" % pontuacoes[i]
		else:
			l.text = "J%d: %d" % [i + 1, pontuacoes[i]]
		_aplicar_estilo_jogador(l, i, i == jogador_atual)


func _aplicar_estilo_jogador(l: Label, indice: int, ativo: bool) -> void:
	var cor: Color = CORES_JOGADORES[indice % CORES_JOGADORES.size()]
	if not ativo:
		cor.a = OPACIDADE_INATIVO

	l.add_theme_color_override("font_color", cor)
	l.add_theme_font_size_override("font_size", TAMANHO_ATIVO if ativo else TAMANHO_INATIVO)

	# Contorno escuro para ler bem sobre qualquer fundo
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.6))
	l.add_theme_constant_override("outline_size", 6 if ativo else 0)


func _atualizar_turno_label() -> void:
	# Atualiza o destaque dos placares e o texto "Vez do Jogador X"
	_atualizar_placar()

	if turno_label:
		# No singleplayer não faz sentido mostrar de quem é a vez
		turno_label.visible = num_jogadores > 1
		turno_label.text = "Vez do Jogador %d" % (jogador_atual + 1)
		turno_label.add_theme_color_override(
			"font_color", CORES_JOGADORES[jogador_atual % CORES_JOGADORES.size()])


# Pequeno "pulo" no label do jogador que acabou de ganhar a vez
func _animar_destaque(indice: int) -> void:
	if indice >= placar_labels.size():
		return
	var l: Label = placar_labels[indice]
	l.pivot_offset = l.size / 2.0
	var tw := create_tween()
	tw.tween_property(l, "scale", Vector2(1.3, 1.3), 0.12)
	tw.tween_property(l, "scale", Vector2.ONE, 0.12)


# Monta o texto final: vencedor ou empate, mais o placar
func _texto_resultado() -> String:
	# Singleplayer: sem vencedor, só a pontuação
	if num_jogadores == 1:
		return "Você Ganhou!\nPontos: %d" % pontuacoes[0]

	var maior: int = pontuacoes.max()
	var vencedores: Array = []
	for i in num_jogadores:
		if pontuacoes[i] == maior:
			vencedores.append(i + 1)

	var titulo := "Empate!"
	if vencedores.size() == 1:
		titulo = "Jogador %d Ganhou!" % vencedores[0]

	var linhas: PackedStringArray = [titulo]
	for i in num_jogadores:
		linhas.append("Jogador %d: %d pontos" % [i + 1, pontuacoes[i]])
	return "\n".join(linhas)
