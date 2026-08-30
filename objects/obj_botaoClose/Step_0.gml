
var _mouse_enter = position_meeting(mouse_x, mouse_y, id);

if (_mouse_enter && mouse_check_button(mb_left)) {
    image_index = 1;
} else {
    image_index = 0;
}

if (_mouse_enter && mouse_check_button_released(mb_left)) {
    // Procura a instância específica do popup que está tocando neste botão
	var _popup_proximo = instance_place(x, y, obj_popup);
    
    // Se encontrou um popup junto deste botão, destrói apenas ele
    if (_popup_proximo != noone) {
        _popup_proximo.encolher = true
    }
    
    // destroi botao
    instance_destroy();
}