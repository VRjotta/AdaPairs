class_name button_3
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
