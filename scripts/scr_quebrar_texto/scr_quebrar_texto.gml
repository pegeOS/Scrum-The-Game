
/// scr_quebrar_texto(string, largura_maxima_em_pixels)
function scr_quebrar_texto(_str, _largura_max) {
    var _linhas = [""];
    var _palavras = string_split(_str, " ");
    var _linha_atual = 0;
    
    for (var i = 0; i < array_length(_palavras); i++) {
        var _palavra = _palavras[i];
        var _teste = _linhas[_linha_atual];
        if(_teste != "") _teste += " ";
        _teste += _palavra;
        
        // se ainda cabe na linha atual, fica; senão, pula pra próxima linha
        if(string_width(_teste) <= _largura_max || _linhas[_linha_atual] == ""){
            _linhas[_linha_atual] = _teste;
        } else {
            _linha_atual++;
            _linhas[_linha_atual] = _palavra;
        }
    }
    
    var _resultado = _linhas[0];
    for(var j = 1; j < array_length(_linhas); j++){
        _resultado += "\n" + _linhas[j];
    }
    return _resultado;
}