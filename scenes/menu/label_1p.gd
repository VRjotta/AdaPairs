extends Label

@export var amplitude: float = 8.0   # Altura máxima do movimento em pixels
@export var speed: float = 3.0       # Velocidade da flutuação

var initial_y: float
var time: float = 0.0

func _ready() -> void:
	initial_y = position.y

func _process(delta: float) -> void:
	time += delta * speed
	position.y = initial_y + sin(time) * amplitude
