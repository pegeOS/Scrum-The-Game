
draw_self()

draw_set_alpha(image_xscale)

//desenhando o texto se nao diminuir o tamanho na hora da destruicao
if(image_xscale >= 0.6 && image_yscale >= 0.6){
	//titulo
	draw_set_font(fnt_windows)
	draw_set_color(c_white)
	draw_text_transformed(x - 135, y - 125, titulo, 1.4, 1.4, 0)

	//conteudo
	draw_set_color(c_black)
	draw_text_ext_transformed(x - 120, y - 65, texto, 30, 250, 1, 1, 0)

}

draw_set_font(-1)
draw_set_color(-1)
draw_set_alpha(-1)