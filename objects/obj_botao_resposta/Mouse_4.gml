// Verifica se o alarme ainda não foi ativado para evitar cliques duplos
if (alarm[0] == -1) {
    image_index = 1; // Muda para o frame do botão clicado
    
    // Define um tempo de espera de 10 frames (aprox. 0.15s) antes de avançar
    alarm[0] = 10; 
}