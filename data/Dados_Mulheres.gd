extends Node

# Dicionário único e compartilhado — acessível via DadosMulheres.mulheres (ou o nome do seu Autoload)
var mulheres = {
	0: {
		"nome": "Ada Lovelace",
		"imagem": "res://assets/images/Mulheres/AdaLovelace.png",
		"resumo": "Pioneira da programação: escreveu em 1843 o primeiro algoritmo processável por uma máquina (a Máquina Analítica de Charles Babbage) e antecipou a computação moderna ao perceber que máquinas poderiam manipular símbolos além de números."
	},
	1: {
		"nome": "Grace Hopper",
		"imagem": "res://assets/images/Mulheres/GraceHopper.png",
		"resumo": "Criou o primeiro compilador da história (A-0) em 1952 e desenvolveu o Flow-Matic, base do COBOL. Foi contra-almirante da Marinha dos EUA e popularizou o termo 'bug' após encontrar uma mariposa presa nos relés do computador Mark II."
	},
	2: {
		"nome": "Margaret Hamilton",
		"imagem": "res://assets/images/Mulheres/MargeretHamilton.png",
		"resumo": "Diretora de engenharia de software do MIT responsável pelo código do computador de bordo das missões Apollo. Popularizou o termo 'Engenharia de Software' e desenvolveu rotinas assíncronas que salvaram o pouso da Apollo 11."
	},
	3: {
		"nome": "Radia Perlman",
		"imagem": "res://assets/images/Mulheres/RadiaPerlman.png",
		"resumo": "Desenvolveu o protocolo Spanning Tree (STP), essencial para evitar loops e viabilizar a expansão das redes Ethernet e da Internet moderna. Também criou o TORTIS para ensinar programação a crianças."
	},
	4: {
		"nome": "Karen Spärck Jones",
		"imagem": "res://assets/images/Mulheres/KarenSparckJones.png",
		"resumo": "Cientista da computação britânica criadora do conceito de IDF (Inverse Document Frequency), pilar fundamental dos mecanismos de busca e NLP. Defendeu a presença feminina com a frase: 'Computação é importante demais para ser deixada apenas para os homens'."
	},
	5: {
		"nome": "Susan Kare",
		"imagem": "res://assets/images/Mulheres/SusanKare.png",
		"resumo": "Designer visual pioneira da Apple responsável pelos ícones clássicos, fontes (como Chicago e Geneva) e metáforas visuais do primeiro Macintosh em 1984, incluindo a lixeira, a tecla Command e a ferramenta balde de tinta."
	},
	6: {
		"nome": "Carol Shaw",
		"imagem": "res://assets/images/Mulheres/CarolShaw.png",
		"resumo": "Primeira designer e programadora feminina de videogames comerciais, trabalhando na Atari e na Activision. Projetou e programou o aclamado jogo River Raid (1982) no Atari 2600, gerando mapas procedurais em apenas 4 KB de ROM."
	},
	7: {
		"nome": "Edith Ranzini",
		"imagem": "res://assets/images/Mulheres/EdithRanzini.png",
		"resumo": "Pioneira da computação brasileira formada pela Poli-USP, participou da construção do 'Patinho Feio' (1972), o primeiro computador desenvolvido no Brasil, e formou gerações de engenheiros na USP e PUC-SP."
	},
	8: {
		"nome": "Frances Allen",
		"imagem": "res://assets/images/Mulheres/FrancisAllen.png",
		"resumo": "Pioneira na otimização de compiladores, computação paralela e fluxo de controle na IBM. Tornou-se em 2006 a primeira mulher a receber o prestigiado Prêmio Turing (Nobel da computação)."
	},
	9: {
		"nome": "Barbara Liskov",
		"imagem": "res://assets/images/Mulheres/BarbaraLiskov.png",
		"resumo": "Criou o Princípio de Substituição de Liskov (o 'L' do SOLID), desenvolveu a linguagem CLU e avanços em algoritmos de consenso tolerantes a falhas bizantinas. Vencedora do Prêmio Turing em 2008."
	},
	10: {
		"nome": "Adele Goldberg",
		"imagem": "res://assets/images/Mulheres/AdeleGoldberg.png",
		"resumo": "Pesquisadora da Xerox PARC e líder da criação do Smalltalk-80 e das interfaces gráficas WIMP (janelas, menus, ponteiros). Demonstrou pessoalmente essa tecnologia para Steve Jobs, inspirando a interface do Macintosh."
	},
	11: {
		"nome": "Mary Kenneth Keller",
		"imagem": "res://assets/images/Mulheres/MarryKeller.png",
		"resumo": "Freira e educadora que se tornou em 1965 a primeira mulher nos EUA a obter um doutorado em Ciência da Computação. Participou do desenvolvimento da linguagem BASIC no Dartmouth College."
	},
	12: {
		"nome": "Jean E. Sammet",
		"imagem": "res://assets/images/Mulheres/JeanSammet.png",
		"resumo": "Criou a linguagem FORMAC para computação algébrica simbólica, participou do comitê original que projetou o COBOL e foi a primeira mulher a presidir a ACM (Association for Computing Machinery)."
	},
	13: {
		"nome": "Sophie Wilson",
		"imagem": "res://assets/images/Mulheres/SophieWilson.png",
		"resumo": "Cientista da computação britânica que concebeu a arquitetura do conjunto de instruções original do processador ARM em 1983, base dos chips de baixo consumo de quase todos os smartphones do mundo."
	},
	14: {
		"nome": "Fei-Fei Li",
		"imagem": "res://assets/images/Mulheres/FeiFeiLi.png",
		"resumo": "Liderou a construção do ImageNet, a base massiva com mais de 14 milhões de imagens rotuladas que catalisou a revolução do Deep Learning e da visão computacional contemporânea. Co-diretora do Stanford HAI."
	},
	15: {
		"nome": "Timnit Gebru",
		"imagem": "res://assets/images/Mulheres/TinmitGebru.png",
		"resumo": "Pesquisadora de ética em IA e fundadora da DAIR. Co-autora dos estudos Gender Shades (revelando viés racial/de gênero em reconhecimento facial) e Stochastic Parrots (riscos de modelos massivos de linguagem)."
	},
	16: {
		"nome": "Lynn Conway",
		"imagem": "res://assets/images/Mulheres/LynnConway.png",
		"resumo": "Revolucionou o design de circuitos integrados com a metodologia Mead-Conway (VLSI) e desenvolveu na IBM o escalonamento dinâmico de instruções, conceito central dos processadores superescalares modernos."
	},
	17: {
		"nome": "Shafi Goldwasser",
		"imagem": "res://assets/images/Mulheres/Shati.png",
		"resumo": "Co-inventora das Provas de Conhecimento Zero (ZKP) e da criptografia probabilística de chave pública. Vencedora de dois Prêmios Gödel e do Prêmio Turing de 2012 pelas bases teóricas de segurança criptográfica."
	},
	18: {
		"nome": "Anita Borg",
		"imagem": "res://assets/images/Mulheres/AnitaBorg.png",
		"resumo": "Especialista em tolerância a falhas e memória compartilhada. Grande ativista pela diversidade, fundou a comunidade digital pioneira Systers e o Grace Hopper Celebration of Women in Computing."
	},
	19: {
		"nome": "Joy Buolamwini",
		"imagem": "res://assets/images/Mulheres/JoyBuolamwini.png",
		"resumo": "Fundadora da Algorithmic Justice League e pesquisadora do MIT Media Lab. Expôs os vieses em sistemas de reconhecimento facial com o estudo Gender Shades, influenciando regulações e pausas de uso em big techs."
	},
	20: {
		"nome": "Elizabeth \"Jake\" Feinler",
		"imagem": "res://assets/images/Mulheres/ElizabethFeinler.png",
		"resumo": "Diretora do Centro de Informações de Rede (NIC) da ARPANET entre 1972 e 1989. Sua equipe criou e administrou os primeiros registros de domínios, serviço Whois e o modelo de TLDs (.com, .org, .gov)."
	},
	21: {
		"nome": "Marcela Alves Pereira",
		"imagem": "res://assets/images/Mulheres/MarcelaALvesPereira.png",
		"resumo": "Graduada em Ciência da Computação pela UESB (2010) e professora no IFBA. Atua no ensino de Programação Orientada a Objetos, Redes e Arquitetura de Computadores, com experiência em Linguagens de Programação e Robótica Educacional."
	},
}
