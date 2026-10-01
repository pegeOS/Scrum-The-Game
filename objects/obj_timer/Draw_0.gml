draw_self();

//deixando amarelinho nos ultimos 5 segundos
if (tempo <= 300) draw_set_colour(c_yellow);
else draw_set_colour(c_white);

draw_set_alpha(1);
draw_set_font(fnt_windows_grande);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//desenha timer
draw_text_transformed(x - 11, y - 2, ceil(tempo / 60), 1.4, 1.4, 0);

// ganho de tempo
if (feedback_alpha > 0) {
    draw_set_alpha(feedback_alpha);
    
    var _cor = c_green; 
    draw_text_transformed_colour(x - 11, feedback_y, "+5", 1.4, 1.4, 0, _cor, _cor, _cor, _cor, feedback_alpha);
    
    draw_set_alpha(1); // reseta o alpha global
}


draw_set_colour(c_white);
draw_set_font(fnt_windows);
draw_set_halign(-1);
draw_set_valign(-1);