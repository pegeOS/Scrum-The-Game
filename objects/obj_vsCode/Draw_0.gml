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
		//situa a posição que a string deve começar a partir do n_typed (oq o player digitou)
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

draw_set_font(fnt_windows_grande)
// desenha o que já foi digitado, em rosa
draw_set_alpha(1)
draw_set_colour(c_fuchsia)
draw_text_ext_transformed(120, 680, digitando, -1, room_width - 400, 1, 1, 0)

// pega só a última linha do que já foi digitado (depois do último \n, se tiver)
var _ultima_linha_digitada = digitando;
var _pos_ultima_quebra = string_last_pos("\n", digitando);
if(_pos_ultima_quebra > 0){
    _ultima_linha_digitada = string_copy(digitando, _pos_ultima_quebra + 1, string_length(digitando) - _pos_ultima_quebra);
}

// quantas linhas o texto digitado já quebrou
var _linhas_digitadas = string_count("\n", digitando);
var _altura_linha = string_height("A"); // altura de uma linha, na fonte atual

var _offset_x = string_width(_ultima_linha_digitada);
var _offset_y = _linhas_digitadas * _altura_linha;

// desenha o resto, em cinza, começando exatamente onde a última linha do rosa parou
draw_set_alpha(0.6)
draw_set_colour(c_gray)

//desenhando cinza
draw_text_ext_transformed(120 + string_width(digitando), 680, _resto, -1, room_width - 400, 1, 1, 0)

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
draw_set_alpha(1)