tempo_decorrido += delta_time / 1000000;
var progresso_dia = clamp(tempo_decorrido / segundos_por_dia, 0, 1);

energy = segment_max * (1 - progresso_dia);

image_index = clamp(round(segment_max - energy), 0, segment_max);

if (energy <= 0) {
    // fim do dia
}