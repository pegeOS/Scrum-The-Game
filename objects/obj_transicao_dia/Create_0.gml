
depth = -99

// controle de opacidade e estado
alpha_tela = 0
estado = "inativo" // estados: "inativo", "escurece", "digitando", "esperando_texto", "some", "esperando_acordar"

texto_completo = ""
texto_desenhado = ""
indice_letra = 0
timer = 0


inicio_jogo = function() {
    estado = "digitando"
    alpha_tela = 1 // tela comeca totalmente preta
    timer = 0
    texto_completo = "DIA " + string(global.dia_atual)
    texto_desenhado = ""
    indice_letra = 0
}
// funcao para iniciar a transição de qualquer lugar do jogo
iniciar_transicao = function() {
    estado = "escurece"
    alpha_tela = 0
    timer = 0
    texto_desenhado = ""
    indice_letra = 0
    
    // faz o jogador deitar na cama imediatamente no fim do dia
    if (instance_exists(obj_player)) {
        obj_player.deitado = true
        obj_player.sprite_index = spr_player_dormindo
        obj_player.image_index = 0
        obj_player.image_speed = 1
        
        if (instance_exists(obj_cama)) {
            obj_player.x = obj_cama.x
            obj_player.y = obj_cama.y - 50
        }
    }
}