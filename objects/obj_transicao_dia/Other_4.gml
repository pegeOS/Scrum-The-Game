
//player começar deitado bonitinho
if (room == rm_quarto && estado != "inativo") {
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

// Posicionar o player de frente para o computador após a Daily
if (room == rm_quarto && global.acordar_no_pc == true) {
    if (instance_exists(obj_player)) {
        obj_player.deitado = false;
        
        // 1. Defina aqui o sprite do jogador olhando para cima (de costas)
        obj_player.sprite_index = spr_player_costas; // <-- MUDE PARA O NOME DO SEU SPRITE
        obj_player.image_index = 0;
        
        // 2. Encontra a mesa do PC para usar como referência de posição
        // <-- MUDE "obj_computador" PARA O NOME DO SEU OBJETO DA MESA
        if (instance_exists(obj_computador)) { 
            
            // Centraliza o jogador horizontalmente com a mesa
            obj_player.x = obj_computador.x;
            
            // Posiciona o jogador logo abaixo da mesa
            // (Ajuste esse valor numérico para mais ou para menos até ficar idêntico à foto)
            obj_player.y = obj_computador.y + 24; 
        }
    }
    
    // Desliga a variável para o fluxo voltar ao normal
    global.acordar_no_pc = false; 
}