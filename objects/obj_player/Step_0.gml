if (deitado) {
    // trava tudo: nem lê movimento, nem muda sprite
    image_speed = 0;
    image_index = 0;
} else {
    move();
    if (key_right) facing = "right";
    else if (key_left) facing = "left";
    else if (key_up) facing = "up";
    else if (key_down) facing = "down";
}