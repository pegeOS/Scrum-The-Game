// pega o tempo decorrido em segundos desde o ultimo frame
var _delta = delta_time / 1000000

if (global.dormindo) {
    // calcula a quantidade de energia que deve subir por segundo
    var _taxa = segment_max / global.duracao_sono
    energy += _taxa * _delta 
} 
else {
    // MODIFICADO: calcula a quantidade de energia que deve cair usando a nova variável
    var _taxa = segment_max / tempo_esgotar_energia
    energy -= _taxa * _delta
}

// trava a energia para nao ficar menor que zero e nem passar do limite maximo
energy = clamp(energy, 0, segment_max)

// ajusta o frame da sprite proporcionalmente a energia
image_index = clamp(round(segment_max - energy), 0, segment_max)