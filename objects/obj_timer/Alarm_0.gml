/// fim do minigame cesarolavo

// hora que o player entrou no minigame
var _hora_entrou = global.hora_entrada_trabalho; 
var _proxima_hora = _hora_entrou;

// horários quebrados de volta
var alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];

// procura o próximo horário quebrado
for (var i = 0; i < array_length(alvos); i++) {
	if (alvos[i] > _hora_entrou + 0.05) {
		_proxima_hora = alvos[i];
		break;
	}
}

// transforma a hora nova em uma porcentagem do dia (0.0 a 1.0)
var _novo_progresso = (_proxima_hora - 7.5) / 14;
_novo_progresso = clamp(_novo_progresso, 0, 1);

// ATUALIZA O TEMPO DECORRIDO (Isso corrige a barra de energia e o relógio de uma vez!)
global.tempo_decorrido = _novo_progresso * global.duracao_dia;

//a atualiza a energia proporcionalmente ao tempo que passou no trabalho
var _segment_max = sprite_get_number(spr_barra_de_energia) - 1;
with (obj_barra_energia) {
	energy = _segment_max * (1 - _novo_progresso);
}

// variavel global fica falsa e volta para a sala principal
global.trabalhando = false;

room_goto(rm_quarto)