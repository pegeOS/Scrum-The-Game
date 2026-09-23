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

if (global.progresso_dia >= 1) {
    show_message("Acabou o dia");
}