var _delta = delta_time / 1000000;

if (global.dormindo) {
    // 1. Acelera o tempo do relógio
    var _fator_aceleracao = global.duracao_dia / global.duracao_sono;
    global.tempo_decorrido += (_delta * _fator_aceleracao);
    
    // 2. Enche a energia
    var _taxa = segment_max / global.duracao_sono;
    energy += _taxa * _delta; 
    
} else {
    // 1. Passa o tempo do relógio normalmente
    global.tempo_decorrido += _delta;
    
    // 2. Gasta a energia
    var _taxa = segment_max / global.duracao_dia;
    energy -= _taxa * _delta;
}

// Atualiza o progresso para o relógio e trava os valores para não passarem do limite
global.progresso_dia = clamp(global.tempo_decorrido / global.duracao_dia, 0, 1);
energy = clamp(energy, 0, segment_max);
image_index = clamp(round(segment_max - energy), 0, segment_max);
//Verifica se o dia já estourou o tempo máximo (22:00)
if (global.progresso_dia >= 1 && !global.dormindo && !global.dia_avancando) { 
    global.dia_avancando = true; 
    
	//Verifica a existẽncia da cama, medida de segurança
    if (!instance_exists(obj_cama)) { 
        room_goto(rm_quarto); 
    } 
    //Verifica a existẽncia do player, medida de segurança
    if (instance_exists(obj_player)) { 
        obj_player.deitado = true; 
        obj_player.sprite_index = spr_player_dormindo; 
        obj_player.image_index = 0; 
        obj_player.image_speed = 1; 
        
        if (instance_exists(obj_cama)) { 
            obj_player.x = obj_cama.x; 
            obj_player.y = obj_cama.y - 50; 
        
        } 
    } 
    
 
    global.tempo_decorrido = 0; 
    global.dia_atual += 1;
	global.transicao_dia = 200
    
    if (global.dia_atual > global.dia_maximo) { 
        global.dia_atual = 1; // por enquanto só reinicia o ciclo — a Sprint Review fica pra depois 
    } 
    
    global.dia_avancando = false; 
}
//Faz o player levantar ao passar do dia
if (global.transicao_dia > 0) {
	global.transicao_dia -=1
	//Se já tiver passado o tempo do player levantar, faz ele levantar
	if (global.transicao_dia <=0 && instance_exists(obj_player)) {
		obj_player.deitado = false
		obj_player.sprite_index = spr_player_idle
		obj_player.image_speed = 4
		if (instance_exists(obj_cama)) {
			obj_player.x = obj_cama.x_levantar
			obj_player.y = obj_cama.y_levantar
		}
	}
}
			


 