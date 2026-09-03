//randomizando os codigos que aparecem
randomize()

vitoria = 3

aguardando_soltar_interacao = true; 
pode_digitar = false;

randomize()

codigos = [
"print('Hello World')",
"var valor = 5", 
"while(True) print('Eu me demito')",
"<p> Scrum, uma metodologia incrivel </p>",
"function soma(a,b) return a + b", 
"for( int i = 0; i < 10; i++ ) print(i)"
]

draw_set_font(fnt_windows_grande)

var _largura_max = room_width - 310;
for(var i = 0; i < array_length(codigos); i++) {
    codigos[i] = scr_quebrar_texto(codigos[i], _largura_max)
}

aleatorio = codigos[irandom(array_length(codigos) - 1)]
digitando = ""

mecanica = function(){ 
	
	if (aguardando_soltar_interacao) {
	    if (keyboard_check_released(ord("E")) || global.veio_do_tutorial) {
	        aguardando_soltar_interacao = false;
	        pode_digitar = true; // Liberado para começar a rodar o minigame!
	    }
	    // Para a execução aqui para não ler nenhuma tecla neste frame
	    exit; 
	}

	if(digitando == "joao amadeus") global.progresso = -67
	
	else{
		tecla = keyboard_check_pressed(vk_anykey)
		if(tecla && pode_digitar){
		    // Ignora teclas de controle que não devem escrever
		    if(keyboard_lastkey != vk_shift && keyboard_lastkey != vk_control && keyboard_lastkey != vk_alt && keyboard_lastkey != vk_escape && keyboard_lastkey != vk_backspace) {
		
		        //último caractere já digitado
		        var _ultimo_char = "";
		        if(string_length(digitando) > 0){
		            _ultimo_char = string_char_at(digitando, string_length(digitando));
		        }
        
		        // só bloqueia se o novo caractere for espaço E o último já for espaço também
		        var _espaco_repetido = (keyboard_lastchar == " " && _ultimo_char == " ");
        
		        if(!_espaco_repetido){
		            digitando += keyboard_lastchar;
		        }
        
		        keyboard_lastchar = "";
			    }
		}

		var _aleatorio_sem_espaco = string_replace_all(aleatorio, " ", "")
		var _digit_sem_espaco = string_replace_all(digitando, " ", "")
	
	
		if(string_length(_digit_sem_espaco) == string_length(_aleatorio_sem_espaco)){
		
			if(_digit_sem_espaco == _aleatorio_sem_espaco ){
	
				//reseta
				reset()
	
				//adiciona 5 ao valor do progresso
				global.progresso += vitoria
			}
			else{
			
				//reseta
				reset()
				
				var _contador = 0
				
					//verifica a quantidade de caracteres diferentes entre as string por um contador
					for(var i = 0; i <= string_length(_digit_sem_espaco); i++){
						if(string_char_at(_digit_sem_espaco, i) != string_char_at(_aleatorio_sem_espaco, i)) _contador++
					}
					
					
					//se o contador for menor que o valor de vitoria ( 5 ), ele so ganha uma parte dos pontos
					if(_contador <= vitoria) global.progresso += vitoria - _contador
					else if(_contador > vitoria){ 
						_contador = 5
						
						//codigo para se o progresso for 3 e ele errar mais do que 5 caracteres ( perde oq falta)
						if(_contador > global.progresso){
							global.progresso -= global.progresso
						}
						else{
							global.progresso -= _contador
						}
					}
			}
		}
	}
}

reset = function(){

		//pegando a posicao do codigo na array
		var _posicao = array_get_index(codigos, aleatorio)
	
		//deletando da array para randomizar dnv
		array_delete(codigos, _posicao, 1)

	if(array_length(codigos) >= 1){
		aleatorio = codigos[irandom(array_length(codigos) - 1)]
	}
	else{
		show_message("gameplay terminada")
		room = rm_quarto
	}
	digitando = ""
}

show_debug_message(aleatorio)