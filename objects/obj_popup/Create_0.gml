
encolher = false
image_xscale = 0
image_yscale = 0

meu_botao = instance_create_layer(x, y, "botoes", obj_botaoClose);
meu_botao.popup_pai = id;

//funcao pro popup surgir
criar = function(){
    x = lerp(x, 414, 0.1);
    y = lerp(y, 464, 0.1);
    
    image_xscale = lerp(image_xscale, 1, 0.2);
    image_yscale = lerp(image_yscale, 1, 0.2);
}

destruir = function(){
	
	
	image_xscale = lerp(image_xscale, 0, 0.2)
	image_yscale = lerp(image_yscale, 0, 0.2)
		
	if(image_xscale <= 0.015 && image_yscale <= 0.015) {
	
		if (instance_exists(meu_botao)) instance_destroy(meu_botao);
		
        encolher = false;
        instance_destroy();
		if(titulo == "Computador"){
			room_goto(rm_codando);
		}// só troca de sala depois que o popup sumiu de vez
    }

}