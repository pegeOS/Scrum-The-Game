// só começa quando a transição de tela preta terminar
if (!iniciou) {
    if (!instance_exists(obj_transicao_dia) || obj_transicao_dia.estado == "inativo") iniciou = true
    exit
}
if (acabou) {
    with (obj_bug) instance_destroy()
    with (obj_barra_progresso) visible = false

    fim_alpha = min(fim_alpha + 0.02, 1)   // ~1 s pra escurecer

    // quando a tela termina de escurecer, cria os dois botões (uma vez só)
    if (fim_alpha >= 1 && !botoes_criados) {
        botoes_criados = true

        var _b1 = instance_create_layer(room_width / 2, room_height / 2 + 60, "Instances", obj_botao)
        _b1.texto = "Nova sprint"
        _b1.image_xscale = 2
        _b1.image_yscale = 0.7
        _b1.depth = -50

        var _b2 = instance_create_layer(room_width / 2, room_height / 2 + 170, "Instances", obj_botao)
        _b2.texto = "Encerrar"
        _b2.image_xscale = 2
        _b2.image_yscale = 0.7
        _b2.depth = -50
    }
    exit
}

var _delta = delta_time / 1000000

// nascem bugs em pontos aleatórios, sem sobrepor outro bug
timer_spawn += _delta
if (timer_spawn >= intervalo_spawn && instance_number(obj_bug) < max_bugs) {
    timer_spawn = 0
    var _raio = (sprite_get_width(spr_bug) * escala_bug) / 2   // raio acompanha o tamanho do bug
    repeat (10) {
        var _x = random_range(area_x1, area_x2)
        var _y = random_range(area_y1, area_y2)
        if (collision_circle(_x, _y, _raio, obj_bug, false, true) == noone) {
            var _bug = instance_create_layer(_x, _y, "Instances", obj_bug)
            _bug.image_xscale = escala_bug
            _bug.image_yscale = escala_bug
			_bug.escala_base = escala_bug
            break
        }
    }
}



// clique elimina o bug que está sob o cursor
if (mouse_check_button_pressed(mb_left)) {
    var _bug = instance_position(mouse_x, mouse_y, obj_bug)
    if (_bug != noone) {
        _bug.vidas --
		_bug.hit_timer = _bug.hit_duracao   // só liga o efeito; quem anima é o obj_bug

        if (_bug.vidas <=0) {
			instance_destroy(_bug)
			bugs_mortos++
	        prog += recompensa
		}
    }
}

// bugs vivos drenam a barra
prog -= instance_number(obj_bug) * dano_por_bug * _delta
prog = clamp(prog, 0, 100)
global.progresso = round(prog)

// fim da review
tempo_restante -= _delta
if (tempo_restante <= 0) {
    tempo_restante = 0
    acabou = true
}