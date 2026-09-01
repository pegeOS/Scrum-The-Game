draw_set_font(fnt_windows); 
draw_set_color(c_red); 
draw_set_halign(fa_right); 
draw_set_valign(fa_top); 
var _margem = 20; 
draw_text(display_get_gui_width() - _margem, _margem, texto_horario); 
draw_set_halign(fa_left); 
draw_set_valign(fa_top);