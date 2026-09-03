

// entrada e saída
if (!encolher) {
    criar();
} else {
    destruir();
}

// atualiza a posição e escala do botão para seguir o popup no lerp
if (instance_exists(meu_botao)) {
    meu_botao.x = x + (140 * image_xscale);
    meu_botao.y = y + (-115 * image_yscale);
    
    meu_botao.image_xscale = image_xscale;
    meu_botao.image_yscale = image_yscale;
}