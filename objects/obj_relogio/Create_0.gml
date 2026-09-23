

pausas = ["8:00","10:00","12:00","14:00","16:00","18:00","20:00"]
pausa_quebrada = ["9:55", "11:55", "13:55", "15:55", "17:55", "19:55", "21:55"]

texto_horario = "";
//variavel de controle pra deixar vermelho ou nao
cor = c_white

//metodo de verificar o horario
verificar_horario = function() {
	
	valor_acao()
	
	for (var i = 0; i <= (array_length(pausas) - 1); i ++) {
		if (!global.acao) {
			
			//SE O HORARIO FOR UM DOS QUEBRADOS MESMO ELE NAO TENDO ESCOLHIDO UMA ACAO, FICA BRANCO
			if(texto_horario == pausa_quebrada[i]){
				cor = c_white
			}
			if(texto_horario == pausas[i]){
				cor = c_red
			}
		}
		else{
			cor = c_white
		}
	}
}
