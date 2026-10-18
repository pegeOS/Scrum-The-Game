/// fim do minigame cesarolavo

// hora que o player entrou no minigame
var _hora_entrou = global.hora_entrada_trabalho; 
var _proxima_hora = _hora_entrou;

// horários quebrados de volta
var alvos = [ 9.9166, 11.9166, 13.9166, 15.9166, 17.9166, 19.9166, 21.9166 ];

// procura o próximo horário quebrado
for (var i = 0; i < array_length(alvos); i++) {
	if (alvos[i] > _hora_entrou + 0.2) {
		_proxima_hora = alvos[i];
		break;
	}
}

// transforma a hora nova em uma porcentagem do dia (0.0 a 1.0)
var _novo_progresso = (_proxima_hora - 7.45) / 14.55; 
_novo_progresso = clamp(_novo_progresso, 0, 1);

// 1. Salva o tempo decorrido antes do pulo temporal
var _tempo_anterior = global.tempo_decorrido;

// 2. Atualiza o tempo decorrido global do jogo
global.tempo_decorrido = _novo_progresso * global.duracao_dia;

// 3. Calcula exatamente quantos segundos foram pulados durante o trabalho
var _segundos_pulados = global.tempo_decorrido - _tempo_anterior;

// 4. Atualiza a energia proporcionalmente ao tempo pulado, usando a nova variável independente
if (instance_exists(obj_barra_energia)) {
	var _segment_max = sprite_get_number(spr_barra_de_energia) - 1;
	with (obj_barra_energia) {
		var _perda_energia = (_segundos_pulados / tempo_esgotar_energia) * _segment_max;
		energy -= _perda_energia;
	}
}

// variavel global fica falsa e volta para a sala principal
global.trabalhando = false;

room_goto(rm_quarto);