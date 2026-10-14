class_name CliqueIrregular
extends TextureButton

func _ready() -> void:
	if not texture_normal:
		return
		
	var imagem_cortada: Image
	
	if texture_normal is AtlasTexture:
		var imagem_completa: Image = texture_normal.atlas.get_image()
		var area_recorte: Rect2i = texture_normal.region
		imagem_cortada = imagem_completa.get_region(area_recorte)
	else:
		imagem_cortada = texture_normal.get_image()
		
	var mascara := BitMap.new()
	mascara.create_from_image_alpha(imagem_cortada, 0.5)
	self.texture_click_mask = mascara
	



# Referências aos nós

# Se estiver usando Sprite2D, troque para:
# @onready var sprite: Sprite2D = $Sprite2D

# Carrega as texturas que você quer usar
var imagem_antiga = preload("res://assets/images/CenarioLuzApagada.png")
var imagem_nova = preload("res://assets/images/cenarioLuzLigada.png")

@export var meu_sprite: Sprite2D
@export var nova_imagem: Texture2D

func _ao_clicar() -> void:
	if meu_sprite and nova_imagem:
		meu_sprite.texture = nova_imagem
