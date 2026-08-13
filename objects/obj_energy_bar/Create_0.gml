// ----- SPRITE E ESCALA -----
image_xscale = 0.15;
image_yscale = 0.15;

sprite_index = spr_barra_de_energia;
segment_max = sprite_get_number(sprite_index) - 1; // último frame = vazio
image_speed = 0;
image_index = 0; // começa cheia

energy = segment_max;

// ----- CONFIGURAÇÃO DO TEMPO -----
minutos_por_dia = 24 * 60;
segundos_por_dia = minutos_por_dia;
tempo_decorrido = 0;