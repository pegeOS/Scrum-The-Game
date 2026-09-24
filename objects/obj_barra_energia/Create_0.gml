
sprite_index = spr_barra_de_energia;
segment_max = sprite_get_number(sprite_index) - 1;
image_speed = 0;
image_index = 0;
energy = segment_max;

global.duracao_dia = 15 * 60;   // segundos que o dia dura acordado
global.duracao_sono = 60;       // segundos que a cama demora pra encher a energia
global.tempo_decorrido = 0;
global.progresso_dia = 0;
global.dormindo = false;