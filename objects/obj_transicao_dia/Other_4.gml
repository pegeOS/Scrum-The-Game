
//player começar deitado bonitinho
if (room == rm_quarto && estado != "inativo") {
    if (instance_exists(obj_player)) {
        obj_player.deitado = true
        obj_player.sprite_index = spr_player_dormindo
        obj_player.image_index = 0
        obj_player.image_speed = 1
        
        if (instance_exists(obj_cama)) {
            obj_player.x = obj_cama.x
            obj_player.y = obj_cama.y - 50
        }
    }
}