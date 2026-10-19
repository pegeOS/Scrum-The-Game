perguntas = [
		"Bom dia, vamos dar início a daily.",
		"O que você fez para ajudar a equipe a alcançar a meta da sprint?",
		"O que você vai fazer hoje até a próxima daily?",
		"Houve algum impedimento travando o seu trabalho?"
]

respostas = [
		["Bom dia, vamos sim!"],
		["Avancei bastante", "Avancei pouco"],
		["Mais código", "Codar e descansar mais"],
		["Não", "Sim, muito cansaço" ]
]

indice_atual = 0; // Controla em qual pergunta estamos
esperando_resposta = false; // Trava o avanço do diálogo

// Posições e tamanhos da caixa de diálogo
caixa_x = 50;
caixa_y = room_height - 150;
caixa_largura = room_width - 100;
caixa_altura = 120;