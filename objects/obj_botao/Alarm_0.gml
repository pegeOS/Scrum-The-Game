
if( texto == "Jogar"){
	
	global.dia_atual = 1

//cria transicao objeto se nao existir
	if(!instance_exists(obj_transicao_dia)){
		instance_create_layer(x, y, "Instances", obj_transicao_dia)
	}

	//iniciar transicao
	obj_transicao_dia.inicio_jogo()

	room_goto(rm_quarto)
	
}

if( texto == "Créditos"){

	room_goto(rm_creditos)
}