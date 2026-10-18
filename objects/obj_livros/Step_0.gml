if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    var _dir_para_livros = point_direction(obj_player.x, obj_player.y, x, y);

    var _olhando = false;

    if (obj_player.facing == "right" && (_dir_para_livros >= 315 || _dir_para_livros < 45)) _olhando = true;
    if (obj_player.facing == "up"    && (_dir_para_livros >= 45  && _dir_para_livros < 135)) _olhando = true;
    if (obj_player.facing == "left"  && (_dir_para_livros >= 135 && _dir_para_livros < 225)) _olhando = true;
    if (obj_player.facing == "down"  && (_dir_para_livros >= 225 && _dir_para_livros < 315)) _olhando = true;

    mostrar_prompt = (_dist <= dist_interacao) && _olhando && !obj_player.estudando;

    if (mostrar_prompt && keyboard_check_pressed(ord("E")) && !global.aprender && obj_relogio.cor == c_red) {
        if (instance_exists(obj_barra_conhecimento) && global.progresso_conhecimento > 0) {
            
           // 1. Atualiza a barra de conhecimento (caminhando do frame 11 para o 0)
			global.progresso_conhecimento -= 1;

			// Garante que não vai descer abaixo de 0 (barra mais do que cheia)
			if (global.progresso_conhecimento < 0) {
			    global.progresso_conhecimento = 0;
			}

			// Atualiza o frame da barra de forma direta e limpa
			if (instance_exists(obj_barra_conhecimento)) {
			        obj_barra_conhecimento.image_index = global.progresso_conhecimento;
			}
			

            // 2. Guarda o horário de entrada
            global.hora_entrada_livros = global.hora_atual;

            // 3. Procura o próximo alvo quebrado (ex: 9.9166, 11.9166, etc.)
            var _hora_entrou = global.hora_entrada_livros; 
            var _proxima_hora = _hora_entrou;

            var alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];

            for (var i = 0; i < array_length(alvos); i++) {
                if (alvos[i] > _hora_entrou + 0.2) {
                    _proxima_hora = alvos[i];
                    break;
                }
            }

           // 4. Calcula o novo tempo decorrido no dia e salva o tempo anterior
            var _novo_progresso = (_proxima_hora - 7.45) / 14.55; 
            _novo_progresso = clamp(_novo_progresso, 0, 1);

            // Salva o tempo decorrido de antes para saber quantos segundos foram pulados
            var _tempo_anterior = global.tempo_decorrido; 
            global.tempo_decorrido = _novo_progresso * global.duracao_dia;
            
            var _segundos_pulados = global.tempo_decorrido - _tempo_anterior;

            // 5. Atualiza a barra de energia
            if (instance_exists(obj_barra_energia)) {
                var _segment_max = sprite_get_number(spr_barra_de_energia) - 1;
                
                with (obj_barra_energia) {
                    // Calcula a energia a ser perdida baseada no tempo pulado e na nova variável
                    var _perda_energia = (_segundos_pulados / tempo_esgotar_energia) * _segment_max;
                    energy -= _perda_energia;
                }
            }

            // 6. RESETA O RELÓGIO PARA BRANCO E FINALIZA A AÇÃO
            obj_relogio.cor = c_white;
            global.aprender = false;
            
        }
    }
}