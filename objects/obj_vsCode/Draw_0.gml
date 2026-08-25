draw_self()

draw_set_font(fnt_windows)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

// quantos caracteres sem ser espaço o player já digitou
var _n_typed = string_length(string_replace_all(digitando, " ", ""));

// acha a posição no texto original correspondente a esse tanto de caracteres 
var _pos = 1;
var _contador = 0;
for(var i = 1; i <= string_length(aleatorio); i++){
	
    var _char = string_char_at(aleatorio, i);

    // Ignora espaços e quebras de linha na contagem
    if (_char != " " && _char != "\n")
    {
        _contador++;
        if(_contador == _n_typed){
            _pos = i + 1;
            break;
        }
    }
}
if(_n_typed == 0) _pos = 1;

// pega só a parte que falta
var _resto = string_copy(aleatorio, _pos, string_length(aleatorio) - _pos + 1);

if (_pos > 1 && string_char_at(aleatorio, _pos - 1) == "\n")
{
    _resto = "\n" + _resto;
}

// desenha o que já foi digitado, em rosa
draw_set_alpha(1)
draw_set_colour(c_fuchsia)
draw_text_ext_transformed(120, 680, digitando, -1, room_width - 500, 1.5, 1.5, 0)

// desenha o resto, em cinza, logo depo	is do que já foi digitado
draw_set_alpha(0.6)
draw_set_colour(c_gray)
draw_text_ext_transformed(120 + string_width(digitando) * 1.5, 680, _resto, -1, room_width - 500, 1.5, 1.5, 0)

draw_set_alpha(1)
draw_set_colour(global.azul)