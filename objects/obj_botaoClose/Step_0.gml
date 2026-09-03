
var _mouse_enter = position_meeting(mouse_x, mouse_y, id);

if (_mouse_enter && mouse_check_button(mb_left)) {
    image_index = 1;
} else {
    image_index = 0;
}

if (_mouse_enter && mouse_check_button_released(mb_left)) {
    
    // Se encontrou um popup junto deste botão, destrói apenas ele
    if (instance_exists(popup_pai)) {
        popup_pai.encolher = true;
    }
    
    // destroi botao
    instance_destroy();
}