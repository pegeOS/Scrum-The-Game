show_debug_message("TESTE: O objeto relogio nasceu!");

pausas = ["8:00 AM","10:00 AM","12:00 AM","2:00 PM","4:00 PM","6:00 PM","8:00 PM","10:00 PM"]
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
