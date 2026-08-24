
tecla = vk_anykey

if(keyboard_check_pressed(tecla)){
	if (tecla != vk_shift && tecla != vk_control && tecla != vk_alt) {
		digitando += keyboard_lastchar;
	}
}