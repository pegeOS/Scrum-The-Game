draw_self()

draw_set_font(fnt_windows_grande)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

var _digitado = string_replace_all(digitando, " ", "")

var _x = 120
var _y = 680
var _cont = 0

var _i = 1
//repetição que ocorre até alcançar o tamanho da palavra original
while (_i <= string_length(aleatorio)) {
    
    var _letra = string_char_at(aleatorio, _i)
    
    // quebra de linha que mede a palavra atual antes de desenhar
    if (_i == 1 || string_char_at(aleatorio, _i - 1) == " ") {
        var _palavra = ""
        var _j = _i
        while (_j <= string_length(aleatorio)) {
            var _c = string_char_at(aleatorio, _j)
            if (_c == " " or _c == "\n") break
            _palavra += _c
            _j++
        }
        
        // se a palavra passar do limite da tela (largura_maxima = room_width - 300)
        if (_x + string_width(_palavra) > 120 + (room_width - 300)) {
            if (_x > 120) {
                _x = 120
                _y += string_height("A")
            }
        }
    }
    
    // quebra manual de linha (\n)
    if (_letra == "\n") {
        _x = 120
        _y += string_height("A")
        _i++
        continue
    }

    // desenho e cores
    if (_letra != " ") {
        _cont++
        
        if (_cont <= string_length(_digitado)) {
            var _letra_digitada = string_char_at(_digitado, _cont)
            
            if (_letra_digitada == _letra) {
                draw_set_colour(c_fuchsia)
                draw_set_alpha(1)
            } else {
                draw_set_colour(c_yellow)
                draw_set_alpha(1)
                _letra = _letra_digitada // Troca a letra original pelo erro
            }
        } else {
            draw_set_colour(c_gray)
            draw_set_alpha(0.6)
        }
        
        draw_text_transformed(_x, _y, _letra, 1, 1, 0)
    }
    
    _x += string_width(_letra)
    _i++
}

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
draw_set_alpha(1)