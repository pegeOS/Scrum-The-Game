var _hora_total = 8 + (global.progresso_dia * 14); 
global.hora_atual = _hora_total; 
var _hora = floor(_hora_total); 
var _minuto = floor(frac(_hora_total) * 60); var _sufixo = (_hora >= 12) ? "PM" : "AM"; 

var _hora_12 = _hora mod 12; 
if (_hora_12 == 0) _hora_12 = 12;
texto_horario = string(_hora_12) + ":" + string_format(_minuto, 2, 0) + " " + _sufixo;