var _delta = delta_time / 1000000;

global.tempo_decorrido += _delta;
global.progresso_dia = clamp(global.tempo_decorrido / global.duracao_dia, 0, 1);

if (global.dormindo) {
    var _taxa = segment_max / global.duracao_sono;
    energy += _taxa * _delta;
} else {
    var _taxa = segment_max / global.duracao_dia;
    energy -= _taxa * _delta;
}

energy = clamp(energy, 0, segment_max);
image_index = clamp(round(segment_max - energy), 0, segment_max);

if (global.progresso_dia >= 1) {
    show_message("Acabou o dia");
}