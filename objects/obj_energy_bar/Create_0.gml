// ----- SPRITE E ESCALA -----
image_xscale = 0.12;
image_yscale = 0.12;

sprite_index = spr_barra_de_energia;
segment_max = sprite_get_number(sprite_index) - 1; // último frame = vazio
image_speed = 0;
image_index = 0; // começa cheia

energy = segment_max;

global.minutos_por_dia = 16 * 60;
global.segundos_por_dia = global.minutos_por_dia;
global.tempo_decorrido = 0;
global.progresso_dia = 0;
global.dormindo = false;
// ----- CONFIGURAÇÃO DO TEMPO -----
minutos_por_dia = 15 * 60;
segundos_por_dia = minutos_por_dia;
tempo_decorrido = 0;
