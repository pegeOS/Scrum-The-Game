
tecla = vk_anykey

if(digitando == "joao amadeus") global.progresso = -67
else{
	
	if(tecla){
	    // Ignora teclas de controle que não devem escrever
	    if(keyboard_lastkey != vk_shift && keyboard_lastkey != vk_control && keyboard_lastkey != vk_alt && keyboard_lastkey != vk_escape) {
		
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
	
			//pegando a posicao do codigo na array
			var _posicao = array_get_index(codigos, aleatorio)
	
			//deletando da array para randomizar dnv
			array_delete(codigos, _posicao, 1)
			
			if(array_length(codigos) > 1) aleatorio = codigos[irandom(array_length(codigos) - 1)]
			digitando = ""
	
			global.progresso += 10
		}
		else{
			//pegando a posicao do codigo na array
			var _posicao = array_get_index(codigos, aleatorio)
	
			//deletando da array para randomizar dnv
			array_delete(codigos, _posicao, 1)
	
			aleatorio = codigos[irandom(array_length(codigos) - 1)]
			digitando = ""
	
			if(global.progresso > 0) global.progresso -= 5
		}
	}
}

