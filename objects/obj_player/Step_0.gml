if(global.hora_atual <= 7.5) {
	obj_player.deitado = true; 
    obj_player.sprite_index = spr_player_dormindo; 
    obj_player.image_index = 0; 
    obj_player.image_speed = 1;
	obj_player.x = obj_cama.x; 
    obj_player.y = obj_cama.y - 50;
	
} else {
	obj_player.deitado = false
	obj_player.sprite_index = spr_player_idle
	obj_player.image_speed = 4
	obj_player.x = obj_cama.x_levantar
    obj_player.y = obj_cama.y_levantar
}

//se nao tiver deitado e nem tiver nenhum pop up na tela, pode se mover
if(!deitado && !instance_exists(obj_popup)){
    move();
    if (key_right) facing = "right";
    else if (key_left) facing = "left";
    else if (key_up) facing = "up";
    else if (key_down) facing = "down";
}
