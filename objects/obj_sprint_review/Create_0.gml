// ---- ajustes pra balancear ----
duracao = 30              // segundos de review
intervalo_spawn = 1.5     // segundos entre bugs
max_bugs = 10
dano_por_bug = 0.3        // % por segundo que cada bug vivo tira da barra
recompensa = 1.5          // % que volta ao matar um bug

// área onde os bugs nascem: a parte azul do "site" (confira as coordenadas no editor)
area_x1 = 100
area_y1 = 250
area_x2 = 720
area_y2 = 800

// posição do texto "Bugs" e "Tempo" (por cima do SITE)
hud_x = 40
hud_y = 20

// ---- estado ----
prog = clamp(global.progresso, 0, 100)   // começa do progresso real da sprint
bugs_mortos = 0
tempo_restante = duracao
timer_spawn = 0
iniciou = false
acabou = false