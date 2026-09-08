show_debug_message("TESTE: O objeto relogio nasceu!");

pausas = ["8:00","10:00","12:00","14:00","16:00","18:00","20:00","22:00"]
texto_horario = "";
//variavel de controle pra deixar vermelho ou nao
cor = c_white

//metodo de verificar o horario
verificar_horario = function() {
	for (var i = 0; i <= (array_length(pausas) - 1); i ++) {
		if (texto_horario == pausas[i]) {
			cor = c_red
			break;
		}
		else{
			cor = c_white
		}
	}
}
