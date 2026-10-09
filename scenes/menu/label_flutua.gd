extends Label

func _ready():
	# Entrada: começa transparente e acima, desce e aparece
	modulate.a = 0.0
	var pos_final = position
	position.y -= 60

	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "modulate:a", 1.0, 1.0)
	tween.tween_property(self, "position", pos_final, 1.0)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	# Quando a entrada terminar, começa a flutuar
	tween.chain().tween_callback(flutuar.bind(pos_final))

func flutuar(pos_base: Vector2):
	var t = create_tween().set_loops()
	t.tween_property(self, "position:y", pos_base.y - 10, 1.2)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	t.tween_property(self, "position:y", pos_base.y, 1.2)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
