extends Control # ou Node2D

# Referências aos nós
@onready var texture_rect: TextureRect = $TextureRect
# Se estiver usando Sprite2D, troque para:
# @onready var sprite: Sprite2D = $Sprite2D

# Carrega as texturas que você quer usar
var imagem_antiga = preload("res://assets/images/CenarioLuzApagada.png")
var imagem_nova = preload("res://assets/images/cenarioLuzLigada.png")

func _on_button_pressed() -> void:
	# Troca a textura exibida
	texture_rect.texture = imagem_nova
	
	# Caso esteja usando Sprite2D:
	# sprite.texture = imagem_nova
