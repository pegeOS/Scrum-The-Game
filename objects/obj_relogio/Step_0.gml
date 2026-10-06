
var _delta = delta_time / 1000000

// atualiza o tempo decorrido do dia
if (global.dormindo) {
    var _fator_aceleracao = global.duracao_dia / global.duracao_sono
    global.tempo_decorrido += (_delta * _fator_aceleracao)
} else {
    global.tempo_decorrido += _delta
}

// atualiza o progresso global do dia (de 0.0 a 1.0)
global.progresso_dia = clamp(global.tempo_decorrido / global.duracao_dia, 0, 1)

// calcula a hora formatada
var _hora_total = 7.45 + (global.progresso_dia * 14.55)
global.hora_atual = _hora_total
var _hora = floor(_hora_total)
var _minuto = floor(frac(_hora_total) * 60)

var _min_str = (_minuto < 10) ? "0" + string(_minuto) : string(_minuto)
texto_horario = string(_hora) + ":" + _min_str

// verifica cor do relogio
verificar_horario()

// verifica se o dia acabou
if (global.progresso_dia >= 1 && !global.dia_avancando) {
    global.dia_avancando = true
    
    if (!instance_exists(obj_transicao_dia)) {
        instance_create_layer(0, 0, "Instances", obj_transicao_dia)
    }
    
    obj_transicao_dia.iniciar_transicao()
}

if (keyboard_check_pressed(vk_f1)) {
    global.tempo_decorrido = global.duracao_dia - 5
}