if (instance_exists(obj_player)) {
	var _dist = point_distance(x, y, obj_player.x, obj_player.y);
	var _dir_para_cama = point_direction(obj_player.x, obj_player.y, x, y);

	var _olhando = false;

	// Corrigido: Para a direita tem que ser "maior que 315 OU menor que 45" (||)
	if (obj_player.facing == "right" && (_dir_para_cama >= 315 || _dir_para_cama < 45)) _olhando = true;
	if (obj_player.facing == "up"    && (_dir_para_cama >= 45  && _dir_para_cama < 135)) _olhando = true;
	if (obj_player.facing == "left"  && (_dir_para_cama >= 135 && _dir_para_cama < 225)) _olhando = true;
	if (obj_player.facing == "down"  && (_dir_para_cama >= 225 && _dir_para_cama < 315)) _olhando = true;

	mostrar_prompt = (_dist <= range_interacao) && _olhando && !obj_player.deitado;

	// LÓGICA DE ACORDAR
	if (obj_player.deitado && global.dormindo) {
		 
		// Se o relógio do jogo alcançar ou passar a hora de acordar
		if (global.hora_atual >= hora_acordar) {
			obj_player.deitado = false;
			obj_player.sprite_index = spr_player_idle;
			obj_player.image_speed = 4;
			obj_player.x = x_levantar;
			obj_player.y = y_levantar;
			
			// Isso faz o tempo parar de voar na obj_barra_energia
			global.dormindo = false; 
		}
	}
	
	if (mostrar_prompt && keyboard_check_pressed(ord("E")) && !global.dormindo && obj_relogio.cor == c_red) {
		
		// Descobre qual é a hora atual pra calcular o alvo
		var _hora_entrou = global.hora_atual;
		var _alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];
		
		// Procura o próximo horário quebrado
		for (var i = 0; i < array_length(_alvos); i++) {
			if (_alvos[i] > _hora_entrou + 0.05) {
				hora_acordar = _alvos[i]; // Salva a hora exata pra acordar (ex: 9.9166)
				break;
			}
		}

		// Posiciona o player e manda dormir (Voltei pro seu cálculo original)
		obj_player.deitado = true;
		obj_player.x = x; 
		obj_player.y = y - 50; 
		
		obj_player.sprite_index = spr_player_dormindo;
		obj_player.image_index = 0;
		obj_player.image_speed = 1;
		
		// Isso faz o tempo voar na obj_barra_energia
		global.dormindo = true; 
	}
}