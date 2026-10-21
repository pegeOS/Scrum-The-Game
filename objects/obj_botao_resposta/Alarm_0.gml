if (instance_exists(id_dialogo)) {
    // Avança a pergunta na caixa de diálogo
    id_dialogo.indice_atual += 1;
    
    // Libera a caixa para criar a próxima rodada de botões
    id_dialogo.esperando_resposta = false;
    
    // Destrói TODOS os botões de resposta da tela
    with (obj_botao_resposta) {
        instance_destroy();
    }
}