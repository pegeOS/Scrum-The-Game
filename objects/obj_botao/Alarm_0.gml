
global.dia_atual = 1

if(!instance_exists(obj_transicao_dia)){

	instance_create_layer(x, y, "Instances", obj_transicao_dia)
}

obj_transicao_dia.inicio_jogo()

room_goto(rm_quarto)