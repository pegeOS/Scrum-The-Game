
// calcula hora
var _hora_total = 7.5 + (global.progresso_dia * 14); 
global.hora_atual = _hora_total; 
var _hora = floor(_hora_total); 
var _minuto = floor(frac(_hora_total) * 60); 

// transforma em texto
var _min_str = (_minuto < 10) ? "0" + string(_minuto) : string(_minuto);
texto_horario = string(_hora) + ":" + _min_str;

// verifica cor
verificar_horario();