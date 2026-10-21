switch (estado) {
    case "inativo":
        break;
        
    case "escurece":
        // escurece a tela
        alpha_tela += 0.01;
        
        if (alpha_tela >= 1) {
            alpha_tela = 1;
            
            // avanca o dia de verdade enquanto a tela esta 100% preta
            if (global.dia_atual > global.dia_maximo) {
                //O QUE ACONTECE DEPOIS DO DIA 7
                global.dia_atual = 1;
            }
            global.tempo_decorrido = 0;
            
            global.dia_atual += 1;
            texto_completo = "DIA " + string(global.dia_atual);
            
      
            estado = "digitando";
        }
        break;
        
    case "digitando":
        // efeito de digitacao nativo
        timer += 0.3;
        
        // a cada 5 frames, adiciona uma letra nova na tela
        if (timer >= 5) { 
            timer = 0;
            
            if (indice_letra < string_length(texto_completo)) {
                indice_letra++;
                texto_desenhado = string_copy(texto_completo, 1, indice_letra);
            } else {
                estado = "esperando_texto";
                timer = 0;
            }
        }
        break;
        
    case "esperando_texto":
        // segura o texto na tela por um momento (1.5 segundos)
        timer++;
        
        if (timer >= 250) { 
            timer = 0;
            estado = "some";
        }
        break;
        
    case "some":
        // some a tela e o texto
        alpha_tela -= 0.01;
        
        if (alpha_tela <= 0) {
            alpha_tela = 0;
            texto_desenhado = "";
            
            // === MUDANÇA: Como já estamos na Daily, a transição acaba aqui ===
            global.dia_avancando = false;
            global.dormindo = false;
            estado = "inativo";
            timer = 0;
        }
        break;
}