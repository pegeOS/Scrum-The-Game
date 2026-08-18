var _dist = point_distance(x, y, obj_player.x, obj_player.y);
var _dir_para_cama = point_direction(obj_player.x, obj_player.y, x, y);

var _olhando = false;

// converte a direção (em graus) pra comparar com o facing do player
if (obj_player.facing == "right" && (_dir_para_cama >= 315 || _dir_para_cama < 45))  _olhando = true;
if (obj_player.facing == "up"    && (_dir_para_cama >= 45  && _dir_para_cama < 135)) _olhando = true;
if (obj_player.facing == "left"  && (_dir_para_cama >= 135 && _dir_para_cama < 225)) _olhando = true;
if (obj_player.facing == "down"  && (_dir_para_cama >= 225 && _dir_para_cama < 315)) _olhando = true;

mostrar_prompt = (_dist <= range_interacao) && _olhando && !obj_player.deitado;

if (mostrar_prompt && keyboard_check_pressed(ord("E"))) {
    obj_player.deitado = true;
    obj_player.x = x;
    obj_player.y = y - 10;
    obj_player.sprite_index = spr_player_idle;
    obj_player.image_index = 0;
    obj_player.image_speed = 0;
} else if (obj_player.deitado && keyboard_check_pressed(ord("E")) && point_distance(x, y, obj_player.x, obj_player.y) <= range_interacao) {
    obj_player.deitado = false;
    obj_player.sprite_index = spr_player_idle;
    obj_player.image_speed = 1;
}