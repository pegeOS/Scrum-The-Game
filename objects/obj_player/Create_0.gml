move_spd = 4;

// Array de sprites organizadas no sentido anti-horário (Direita, Cima, Esquerda, Baixo)
// Essa ordem exata (0, 1, 2, 3) casa com a lógica do point_direction
sprites_movimento = [spr_player_dire, spr_player_costa, spr_player_esq, spr_player_frente];

// Sprite padrão para quando o jogador estiver parado
sprite_parado = spr_player_idle;

move = function(){

	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
	key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
	key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

	// 2. Calcular a direção dos eixos
	var _input_x = key_right - key_left;
	var _input_y = key_down - key_up;

	// 3. Verificar se há movimento
	if ((_input_x != 0 || _input_y != 0) && !obj_player.deitado) {
		image_speed = 1
	    // Obter direção em graus (0 a 360)
	    var _move_dir = point_direction(0, 0, _input_x, _input_y);
    
	    // Converter direção em velocidade X e Y (diagonal corrigida)
	    var _hspd = lengthdir_x(move_spd, _move_dir);
	    var _vspd = lengthdir_y(move_spd, _move_dir);
    
	    // Mover aplicando colisões (Substitua obj_wall pela sua parede)
		if(!deitado){
			move_and_collide(_hspd, _vspd, obj_wall);
			// --- SISTEMA DE DIRECIONAMENTO DE SPRITE ---
		    // Divide os 360° por 90° para obter um índice de 0 a 4.
		    // O round() ajusta diagonais para a direção ortogonal mais próxima.
		    var _indice_sprite = round(_move_dir / 90) % 4;
    
		    // Aplica a sprite correta do array
		    sprite_index = sprites_movimento[_indice_sprite];
		}
    
	   
	}
	else{
		image_index = 0
		image_speed = 0
		
	}

}

facing = "down"; // pra onde o personagem está olhando: "up","down","left","right"
deitado = false; // se o personagem está deitado ou não



