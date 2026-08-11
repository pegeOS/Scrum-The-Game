move_spd = 4;

// Array de sprites organizadas no sentido anti-horário (Direita, Cima, Esquerda, Baixo)
// Essa ordem exata (0, 1, 2, 3) casa com a lógica do point_direction
sprites_movimento = [spr_player_dire, spr_player_costa, spr_player_esq, spr_player_frente];

// Sprite padrão para quando o jogador estiver parado
sprite_parado = spr_player_idle;