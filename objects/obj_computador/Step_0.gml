
//FAZENDO O PLAYER ENTRAR NO COMPUTADOR
var _colide = place_meeting(x, y, obj_player)
var _clicou = keyboard_check_pressed(ord("E"))

if(_colide && _clicou && obj_player.sprite_index == spr_player_costa){

	if(!global.tutorial_pc){
        instance_create_layer(x, y, "popups", obj_popup)
        global.tutorial_pc = true
		global.veio_do_tutorial = true
    }
    else{
        room_goto(rm_codando)
    }
}