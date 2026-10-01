
if (tempo > 0) {
    tempo -= 1;
    
    // se o tempo acabou nesse frame, roda o código do Alarm[0]
    if (tempo <= 0) {
        event_perform(ev_alarm, 0); 
    }
}

// animacao do ganho de tempo
//se ele nao tiver traansparente
if (feedback_alpha > 0) {
    feedback_y -= 0.05;          // texto sobre
    feedback_alpha = lerp(feedback_alpha, 0, 0.04);    // sumindo aos poucos
}