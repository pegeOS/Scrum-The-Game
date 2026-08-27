
//FAZENDO O PLAYER ENTRAR NO COMPUTADOR
var _colide = place_meeting(x, y, obj_player)
var _clicou = keyboard_check_pressed(ord("E"))

if(_colide && _clicou && obj_player.sprite_index == spr_player_costa){

	room_goto(rm_codando)

}