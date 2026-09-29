extends Button

signal carta_clicada(carta)

enum EstadoCarta{ESCONDIDA, VIRADA, RESOLVIDA}

var estado: EstadoCarta = EstadoCarta.ESCONDIDA
var valor: int
