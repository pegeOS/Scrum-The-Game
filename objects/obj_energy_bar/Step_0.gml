global.tempo_decorrido += delta_time / 1000000;
global.progresso_dia = clamp(global.tempo_decorrido / global.segundos_por_dia, 0, 1);

image_index = clamp(round(segment_max - energy), 0, segment_max);


if (global.dormindo) {
    energy = segment_max * (0.3 + global.progresso_dia); // dormindo: energia sobe
} else {
    energy = segment_max * (1 - global.progresso_dia); // acordado: energia cai
}

if (global.progresso_dia >= 1) {
    show_message("Acabou o dia");
}