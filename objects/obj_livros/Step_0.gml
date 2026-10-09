if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    var _dir_para_livros = point_direction(obj_player.x, obj_player.y, x, y);

    var _olhando = false;

    // Corrigido: Para a direita tem que ser "maior que 315 OU menor que 45" (||)
    if (obj_player.facing == "right" && (_dir_para_livros >= 315 || _dir_para_livros < 45)) _olhando = true;
    if (obj_player.facing == "up"    && (_dir_para_livros >= 45  && _dir_para_livros < 135)) _olhando = true;
    if (obj_player.facing == "left"  && (_dir_para_livros >= 135 && _dir_para_livros < 225)) _olhando = true;
    if (obj_player.facing == "down"  && (_dir_para_livros >= 225 && _dir_para_livros < 315)) _olhando = true;

    mostrar_prompt = (_dist <= dist_interacao) && _olhando && !obj_player.estudando;

    if (mostrar_prompt && keyboard_check_pressed(ord("E")) &&  !global.aprender && obj_relogio.cor == c_red) {
        if (instance_exists(obj_barra_conhecimento) && obj_barra_conhecimento.bar > 0) {
            obj_barra_conhecimento.bar -= 1;
			obj_barra_conhecimento.image_speed = 0;
			global.aprender = true;
			// Descobre qual é a hora atual pra calcular o alvo
			var _hora_entrou = global.hora_atual;
			var _alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];
		
			// Procura o próximo horário quebrado
			for (var i = 0; i < array_length(_alvos); i++) {
				if (_alvos[i] > _hora_entrou + 0.05) {
					global.hora_atual = _alvos[i]; // Salva a hora exata pra acordar (ex: 9.9166)
					break;
				}
			}
			
            if (obj_barra_conhecimento.bar < 0) {
                obj_barra_conhecimento.bar = 0;
            }
        }
    }
}