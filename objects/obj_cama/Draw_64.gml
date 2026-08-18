draw_set_color(c_white);
draw_text(10, 10, "dist: " + string(point_distance(x_deitar, y_deitar, obj_player.x, obj_player.y)));
draw_text(10, 30, "facing: " + obj_player.facing);
draw_text(10, 50, "mostrar_prompt: " + string(mostrar_prompt));
draw_text(10, 70, "deitado (via cama): " + string(obj_player.deitado));

if (mostrar_prompt) {
    var _px = x - camera_get_view_x(view_camera[0]);
    var _py = y - camera_get_view_y(view_camera[0]) - 40;
    draw_text(_px, _py, "Aperte E para deitar");
}