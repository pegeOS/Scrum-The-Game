if (hour_timer >= hour_length) {
    hour_timer = 0;
    current_hour += 2;
    
    if (current_hour >= 24) {
        current_hour -= 24;
    }
}