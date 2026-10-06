
// pega o tempo decorrido em segundos desde o ultimo frame
var _delta = delta_time / 1000000

if (global.dormindo) {
	
    // calcula a quantidade de energia que deve subir por segundo
    var _taxa = segment_max / global.duracao_sono
    energy += _taxa * _delta 
} 
else {
    // calcula a quantidade de energia que deve cair por segundo
    var _taxa = segment_max / global.duracao_dia
    energy -= _taxa * _delta
}

// trava a energia para nao ficar menor que zero e nem passar do limite maximo
energy = clamp(energy, 0, segment_max)

// ajusta o frame da sprite proporcionalmente a energia (inverte porque o frame 0 e a barra cheia)
image_index = clamp(round(segment_max - energy), 0, segment_max)
