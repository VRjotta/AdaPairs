var cartas: Array=[]

func gerar_valores(quantidade_de_pares: int)->Array:
	var valores=[]
	for i in range(quantidade_de_pares):
		valores.append(i)
		valores.append(i)
	valores.shuffle()
	print(valores)
	return valores
