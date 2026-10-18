sprite_index = spr_barra_de_energia;
segment_max = sprite_get_number(sprite_index) - 1;
image_speed = 0;
image_index = 0;
energy = segment_max;

global.duracao_dia = 15 * 60;   // segundos que o dia dura (NÃO afeta mais a energia)
global.duracao_sono = 60;       // segundos que a cama demora pra encher a energia
tempo_esgotar_energia = 6 * 60; // NOVO: segundos para a barra de energia ir de cheia a zero
global.tempo_decorrido = 0;
global.progresso_dia = 0;
global.dormindo = false;