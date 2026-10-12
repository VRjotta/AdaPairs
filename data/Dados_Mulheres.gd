extends Node

# Dicionário único e compartilhado — acessível via DadosMulheres.mulheres (ou o nome do seu Autoload)
var mulheres = {
	0: {
		"nome": "Ada Lovelace",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pioneira da programação: escreveu em 1843 o primeiro algoritmo processável por uma máquina (a Máquina Analítica de Charles Babbage) e antecipou a computação moderna ao perceber que máquinas poderiam manipular símbolos além de números."
	},
	1: {
		"nome": "Grace Hopper",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Criou o primeiro compilador da história (A-0) em 1952 e desenvolveu o Flow-Matic, base do COBOL. Foi contra-almirante da Marinha dos EUA e popularizou o termo 'bug' após encontrar uma mariposa presa nos relés do computador Mark II."
	},
	2: {
		"nome": "Hedy Lamarr",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Atriz e inventora, patenteou na Segunda Guerra Mundial a tecnologia de salto de frequência (frequency hopping) para guiar torpedos, princípio que se tornou a fundação para o Wi-Fi, Bluetooth, GPS e telefonia celular."
	},
	3: {
		"nome": "Margaret Hamilton",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Diretora de engenharia de software do MIT responsável pelo código do computador de bordo das missões Apollo. Popularizou o termo 'Engenharia de Software' e desenvolveu rotinas assíncronas que salvaram o pouso da Apollo 11."
	},
	4: {
		"nome": "Radia Perlman",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Desenvolveu o protocolo Spanning Tree (STP), essencial para evitar loops e viabilizar a expansão das redes Ethernet e da Internet moderna. Também criou o TORTIS para ensinar programação a crianças."
	},
	5: {
		"nome": "Katherine Johnson",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Física e matemática da NASA, calculou manualmente trajetórias orbitais cruciais para as missões espaciais americanas, incluindo o voo de John Glenn, que exigiu sua validação manual antes de decolar na Friendship 7."
	},
	6: {
		"nome": "Karen Spärck Jones",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Cientista da computação britânica criadora do conceito de IDF (Inverse Document Frequency), pilar fundamental dos mecanismos de busca e NLP. Defendeu a presença feminina com a frase: 'Computação é importante demais para ser deixada apenas para os homens'."
	},
	7: {
		"nome": "Susan Kare",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Designer visual pioneira da Apple responsável pelos ícones clássicos, fontes (como Chicago e Geneva) e metáforas visuais do primeiro Macintosh em 1984, incluindo a lixeira, a tecla Command e a ferramenta balde de tinta."
	},
	8: {
		"nome": "Carol Shaw",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Primeira designer e programadora feminina de videogames comerciais, trabalhando na Atari e na Activision. Projetou e programou o aclamado jogo River Raid (1982) no Atari 2600, gerando mapas procedurais em apenas 4 KB de ROM."
	},
	9: {
		"nome": "Edith Ranzini",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pioneira da computação brasileira formada pela Poli-USP, participou da construção do 'Patinho Feio' (1972), o primeiro computador desenvolvido no Brasil, e formou gerações de engenheiros na USP e PUC-SP."
	},
	10: {
		"nome": "Frances Allen",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pioneira na otimização de compiladores, computação paralela e fluxo de controle na IBM. Tornou-se em 2006 a primeira mulher a receber o prestigiado Prêmio Turing (Nobel da computação)."
	},
	11: {
		"nome": "Barbara Liskov",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Criou o Princípio de Substituição de Liskov (o 'L' do SOLID), desenvolveu a linguagem CLU e avanços em algoritmos de consenso tolerantes a falhas bizantinas. Vencedora do Prêmio Turing em 2008."
	},
	12: {
		"nome": "Adele Goldberg",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pesquisadora da Xerox PARC e líder da criação do Smalltalk-80 e das interfaces gráficas WIMP (janelas, menus, ponteiros). Demonstrou pessoalmente essa tecnologia para Steve Jobs, inspirando a interface do Macintosh."
	},
	13: {
		"nome": "Mary Kenneth Keller",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Freira e educadora que se tornou em 1965 a primeira mulher nos EUA a obter um doutorado em Ciência da Computação. Participou do desenvolvimento da linguagem BASIC no Dartmouth College."
	},
	14: {
		"nome": "Jean E. Sammet",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Criou a linguagem FORMAC para computação algébrica simbólica, participou do comitê original que projetou o COBOL e foi a primeira mulher a presidir a ACM (Association for Computing Machinery)."
	},
	15: {
		"nome": "Sophie Wilson",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Cientista da computação britânica que concebeu a arquitetura do conjunto de instruções original do processador ARM em 1983, base dos chips de baixo consumo de quase todos os smartphones do mundo."
	},
	16: {
		"nome": "Fei-Fei Li",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Liderou a construção do ImageNet, a base massiva com mais de 14 milhões de imagens rotuladas que catalisou a revolução do Deep Learning e da visão computacional contemporânea. Co-diretora do Stanford HAI."
	},
	17: {
		"nome": "Timnit Gebru",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pesquisadora de ética em IA e fundadora da DAIR. Co-autora dos estudos Gender Shades (revelando viés racial/de gênero em reconhecimento facial) e Stochastic Parrots (riscos de modelos massivos de linguagem)."
	},
	18: {
		"nome": "Lynn Conway",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Revolucionou o design de circuitos integrados com a metodologia Mead-Conway (VLSI) e desenvolveu na IBM o escalonamento dinâmico de instruções, conceito central dos processadores superescalares modernos."
	},
	19: {
		"nome": "Shafi Goldwasser",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Co-inventora das Provas de Conhecimento Zero (ZKP) e da criptografia probabilística de chave pública. Vencedora de dois Prêmios Gödel e do Prêmio Turing de 2012 pelas bases teóricas de segurança criptográfica."
	},
	20: {
		"nome": "Anita Borg",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Especialista em tolerância a falhas e memória compartilhada. Grande ativista pela diversidade, fundou a comunidade digital pioneira Systers e o Grace Hopper Celebration of Women in Computing."
	},
	21: {
		"nome": "Joy Buolamwini",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Fundadora da Algorithmic Justice League e pesquisadora do MIT Media Lab. Expôs os vieses em sistemas de reconhecimento facial com o estudo Gender Shades, influenciando regulações e pausas de uso em big techs."
	},
	22: {
		"nome": "Elizabeth \"Jake\" Feinler",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Diretora do Centro de Informações de Rede (NIC) da ARPANET entre 1972 e 1989. Sua equipe criou e administrou os primeiros registros de domínios, serviço Whois e o modelo de TLDs (.com, .org, .gov)."
	},
	23: {
		"nome": "Erna Schneider Hoover",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Inventou nos Laboratórios Bell um sistema computadorizado que controlava o fluxo de centrais telefônicas ajustando prioridades de execução, gerando uma das primeiras patentes de software em tempo real em 1971."
	},
	24: {
		"nome": "Roberta Williams",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Pioneira em aventuras gráficas e co-fundadora da Sierra On-Line. Criou Mystery House (o primeiro adventure ilustrado da história) e a aclamada série King's Quest, definindo convenções de enredo e arte em jogos de PC."
	},
	25: {
		"nome": "Dorothy Vaughan",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Primeira mulher negra supervisora na NACA/NASA. Antecipou o impacto dos computadores digitais, dominou a linguagem FORTRAN e liderou o treinamento da equipe para operar os mainframes IBM da agência espacial."
	},
	26: {
		"nome": "Sister Mary Celine Fasenmyer",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Matemática e religiosa que desenvolveu o 'Algoritmo de Sister Celine' para relações de recorrência em séries hipergeométricas, servindo de base fundamental para álgebra computacional moderna (Mathematica, Maple)."
	},
	27: {
		"nome": "Megan Smith",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Engenheira formada pelo MIT, foi a 3ª CTO dos Estados Unidos na administração Obama e atuou por 11 anos como VP do Google, liderando aquisições que originaram o Google Earth e Google Maps."
	},
	28: {
		"nome": "Corinna Cortes",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Co-desenvolvedora dos Support Vector Machines (SVM) de margens suaves nos Bell Labs, um dos pilares do aprendizado de máquina supervisionado. Também atuou na liderança do Google Research em NY."
	},
	29: {
		"nome": "Clarisse Sieckenius de Souza",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Professora emérita da PUC-Rio e criadora da Engenharia Semiótica, teoria focada na comunicação metalinguística entre desenvolvedores e usuários. Membro eleita da ACM SIGCHI Academy."
	},
	30: {
		"nome": "Claudia Bauzer Medeiros",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Professora titular da Unicamp e referência nacional em e-Science e gestão de dados científicos multidisciplinares. Ex-presidente da SBC e liderança de programas de Ciência Aberta na FAPESP."
	},
	31: {
		"nome": "Nina da Hora",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Cientista da computação formada pela PUC-Rio, fundadora do Instituto Da Hora e referência em segurança da informação, ética algorítmica e transparência eleitoral no Brasil."
	},
	32: {
		"nome": "Marcela Alves Pereira",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Graduada em Ciência da Computação pela UESB (2010) e professora no IFBA. Atua no ensino de Programação Orientada a Objetos, Redes e Arquitetura de Computadores, com experiência em Linguagens de Programação e Robótica Educacional."
	},
	33: {
		"nome": "Vivyane Coelho Caires",
		"imagem": "res://assets/images/carta_exemplo.jpg",
		"resumo": "Professora do IFBA Vitória da Conquista, mestre em Engenharia de Software pela UNIFACS, especialista em Banco de Dados e graduada pela UFPB. Possui sólida formação técnica iniciada no CEFET-PB."
	},
}
	# adicionem as outras mulheres aqui, seguindo o mesmo padrão
