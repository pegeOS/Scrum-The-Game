//se nao tiver deitado e nem tiver nenhum pop up na tela, pode se mover
if(!deitado && !instance_exists(obj_popup)){
    move();
    if (key_right) facing = "right";
    else if (key_left) facing = "left";
    else if (key_up) facing = "up";
    else if (key_down) facing = "down";
}