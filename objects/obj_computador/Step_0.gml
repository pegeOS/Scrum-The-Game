var _colide = place_meeting(x, y, obj_player)
var _clicou = keyboard_check_pressed(ord("E"))
var _de_costas = (obj_player.sprite_index == spr_player_costa)

if (_colide && _clicou && _de_costas && !instance_exists(obj_popup)) {

    if (global.daily_pendente) {
        room_goto(rm_daily)
    }
    else if (obj_relogio.cor == c_red) {
        if (!global.tutorial_pc) {
            instance_create_layer(x, y, "popups", obj_popup)
            global.tutorial_pc = true
            global.veio_do_tutorial = true
            global.hora_entrada_trabalho = global.hora_atual
        }
        else {
            room_goto(rm_codando)
        }
    }
}