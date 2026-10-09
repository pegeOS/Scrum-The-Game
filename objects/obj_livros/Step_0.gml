if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    var _dir_para_livros = point_direction(obj_player.x, obj_player.y, x, y);

    var _olhando = false;

    // Checa a direção para onde o player está olhando
    if (obj_player.facing == "right" && (_dir_para_livros >= 315 || _dir_para_livros < 45)) _olhando = true;
    if (obj_player.facing == "up"    && (_dir_para_livros >= 45  && _dir_para_livros < 135)) _olhando = true;
    if (obj_player.facing == "left"  && (_dir_para_livros >= 135 && _dir_para_livros < 225)) _olhando = true;
    if (obj_player.facing == "down"  && (_dir_para_livros >= 225 && _dir_para_livros < 315)) _olhando = true;

    mostrar_prompt = (_dist <= dist_interacao) && _olhando && !obj_player.estudando;

    if (mostrar_prompt && keyboard_check_pressed(ord("E")) && !global.aprender && obj_relogio.cor == c_red) {
        if (instance_exists(obj_barra_conhecimento) && obj_barra_conhecimento.bar > 0) {
            
            // 1. Atualiza a barra de conhecimento
            obj_barra_conhecimento.bar -= 1;
            obj_barra_conhecimento.image_speed = 0;
            
            if (obj_barra_conhecimento.bar < 0) {
                obj_barra_conhecimento.bar = 0;
            }
            
            // Sincroniza o frame da sprite com o valor da barra (se aplicável)
            obj_barra_conhecimento.image_index = obj_barra_conhecimento.bar;

            // 2. Marca que aprendeu e pega o horário atual
            global.aprender = true;
            global.hora_entrada_livros = global.hora_atual;

            // 3. Lógica para pular o tempo
            var _hora_entrou = global.hora_entrada_livros; 
            var _proxima_hora = _hora_entrou;

            var alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];

            for (var i = 0; i < array_length(alvos); i++) {
                if (alvos[i] > _hora_entrou + 0.2) {
                    _proxima_hora = alvos[i];
                    break;
                }
            }

            // Calcula novo progresso e tempo decorrido
            var _novo_progresso = (_proxima_hora - 7.45) / 14.55; 
            _novo_progresso = clamp(_novo_progresso, 0, 1);

            global.tempo_decorrido = _novo_progresso * global.duracao_dia;

            // 4. Atualiza a energia do jogador
            global.hora_atual = _proxima_hora
			if (instance_exists(obj_barra_energia)) {
                var _segment_max = sprite_get_number(spr_barra_de_energia) - 1;
                with (obj_barra_energia) {
                    energy = _segment_max * (1 - _novo_progresso);
                }
            }
            
        }
    }
}