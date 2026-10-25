if (!esperando_resposta && indice_atual < array_length(perguntas)) {
    esperando_resposta = true;
    
    var array_opcoes = respostas[indice_atual];
    var qtd_opcoes = array_length(array_opcoes);
    
    // Define a fonte aqui também para que o GameMaker calcule o tamanho real do texto
    draw_set_font(fnt_windows); 
    
    var espacamento = 30; // Espaço vazio horizontal entre um botão e outro
    var margem_botao = 40; // Espaço extra "dentro" do botão (20px de borda de cada lado)
    
    var larguras = [];
    var largura_total = 0;
    
    // 1. Calcula a largura individual de cada botão e a largura total ocupada por eles
    for (var i = 0; i < qtd_opcoes; i++) {
        var w = string_width(array_opcoes[i]) + margem_botao;
        larguras[i] = w;
        largura_total += w;
    }
    // Adiciona o espaçamento entre os botões na largura total
    largura_total += espacamento * (qtd_opcoes - 1);
    
    // 2. Define o ponto de partida (X e Y) para centralizar tudo na tela azul
    var pos_x_atual = (room_width / 2) - (largura_total / 2);
    var pos_y = (room_height / 2) - 30; // Ajuste o "- 30" para subir ou descer os botões
    
    // 3. Cria os botões e os posiciona lado a lado
    for (var i = 0; i < qtd_opcoes; i++) {
        // (pos_x_atual + larguras[i] / 2) garante que o centro do botão fique no lugar certo
        var btn = instance_create_layer(pos_x_atual + (larguras[i] / 2), pos_y, "Instances", obj_botao_resposta);
        
        btn.texto = array_opcoes[i];
        btn.id_dialogo = id;
        
        // Estica o tamanho horizontal do botão para caber o texto
        btn.image_xscale = larguras[i] / sprite_get_width(btn.sprite_index);
        
        // Avança o cursor imaginário no eixo X para criar o próximo botão ao lado
        pos_x_atual += larguras[i] + espacamento;
    }
    
    draw_set_font(-1); // Reseta a fonte
} 
else if (indice_atual >= array_length(perguntas)) {
    if (mouse_check_button_pressed(mb_left)) {
        global.daily_pendente = false
        global.tempo_decorrido = ((7.92 - 7.45) / 14.55) * global.duracao_dia   // ~7:55
        room_goto(rm_quarto)
    }
}