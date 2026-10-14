extends TextureButton

func _ready():
	# Verifica se você colocou a AtlasTexture no campo Texture -> Normal
	if texture_normal is AtlasTexture:
		# 1. Pega a imagem inteira (da spritesheet/textura original)
		var imagem_completa : Image = texture_normal.atlas.get_image()
		
		# 2. Recorta apenas a região que você definiu no Atlas
		var area_recorte : Rect2i = texture_normal.region
		var imagem_cortada : Image = imagem_completa.get_region(area_recorte)
		
		# 3. Cria a máscara de clique (BitMap) a partir desse pedaço cortado
		var mascara = BitMap.new()
		mascara.create_from_image_alpha(imagem_cortada, 0.5) # 0.5 ignora pixels semitransparentes
		
		# 4. Aplica a máscara ao botão
		self.texture_click_mask = mascara
