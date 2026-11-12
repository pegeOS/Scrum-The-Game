if (hit_timer > 0) {
    hit_timer--
    var _t = 1 - (hit_timer / hit_duracao)
    var _s = escala_base * (1 + 0.3 * sin(_t * pi))
    image_xscale = _s
    image_yscale = _s
} else {
    image_xscale = escala_base
    image_yscale = escala_base
}