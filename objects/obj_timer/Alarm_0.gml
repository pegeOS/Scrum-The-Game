/// Evento Alarm do objeto Timer (fim do minigame)

// 1. Pega a hora em que o player entrou no minigame
var _hora_entrou = global.hora_entrada_trabalho; 
var _proxima_hora = _hora_entrou;

// 2. Horários alvos em formato decimal (9:55, 11:55, 13:55, 15:55, 17:55, 19:55, 21:55)
var _alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];

// 3. Procura o próximo horário quebrado
for (var i = 0; i < array_length(_alvos); i++) {
	if (_alvos[i] > _hora_entrou + 0.05) {
		_proxima_hora = _alvos[i];
		break;
	}
}

// 4. Transforma a hora nova em uma porcentagem do dia (0.0 a 1.0)
var _novo_progresso = (_proxima_hora - 7.5) / 14;
_novo_progresso = clamp(_novo_progresso, 0, 1);

// 5. ATUALIZA O TEMPO DECORRIDO (Isso corrige a barra de energia e o relógio de uma vez!)
global.tempo_decorrido = _novo_progresso * global.duracao_dia;

// 6. Atualiza a energia proporcionalmente ao tempo que passou no trabalho
var _segment_max = sprite_get_number(spr_barra_de_energia) - 1;
with (obj_barra_energia) {
	energy = _segment_max * (1 - _novo_progresso);
}

// 7. Desliga o trabalho e volta para a sala principal
global.trabalhando = false;

room_goto(rm_quarto)