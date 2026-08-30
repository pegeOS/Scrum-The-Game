
criado = false

image_xscale = 0
image_yscale = 0
//funcao pro popup surgir
criar = function(){
	
	image_xscale = lerp(image_xscale, 1, 0.1)
	image_yscale = lerp(image_yscale, 1, 0.1)
}


//criando botao interativo de close junto do popup toda vez
instance_create_layer(x + 128, y - 104, "botoes", obj_botaoClose)

encolher = false

destruir = function(){
	
	
	image_xscale = lerp(image_xscale, 0, 0.2)
	image_yscale = lerp(image_yscale, 0, 0.2)
		
	if(image_xscale <= 0.015 && image_yscale <= 0.015) instance_destroy(id)

}