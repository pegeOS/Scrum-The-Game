global.hora_atual = 0;
texto_horario = "";
cor = c_white;

pausas = ["8:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00"];

alvos_quebrados = [
	9 + (55/60),  // 9:55
	11 + (55/60), // 11:55
	13 + (55/60), // 13:55
	15 + (55/60), // 15:55
	17 + (55/60), // 17:55
	19 + (55/60), // 19:55
	21 + (55/60)  // 21:55
];

verificar_horario = function() {
	valor_acao();
	
	if (global.acao == true) {
		// Se o player escolheu trabalhar ou dormir, fica branco
		cor = c_white;
	} else {
		// Se ele não escolheu ação, checa se é hora de ficar vermelho
		for (var i = 0; i < array_length(pausas); i++) {
			if (texto_horario == pausas[i]) {
				cor = c_red;
				break;
			}
		}
	}
}