// o relógio acompanha o fade da transição: invisível com a tela preta, aparece junto com o quarto
var _alpha = 1
if (instance_exists(obj_transicao_dia)) _alpha = 1 - obj_transicao_dia.alpha_tela


draw_set_font(fnt_windows);
draw_set_alpha(1)

draw_text_transformed_colour(x + 45, y - 25, texto_horario, 2, 2, 0, cor, cor, cor, cor, _alpha); 

draw_set_halign(-1); 
draw_set_valign(-1);
draw_set_colour(-1)
