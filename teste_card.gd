extends Node

@onready var carta = $Card

func _ready():
	carta.definir_dados(3, "res://assets/images/ec80cfd399bdcbb6f700ff622346447d.jpg")
	carta.carta_clicada.connect(func(c): print("clicada: valor=", c.valor, " estado=", c.estado))
