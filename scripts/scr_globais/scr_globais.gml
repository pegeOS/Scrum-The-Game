
global.progresso = 0

global.tutorial_pc = false
global.veio_do_tutorial = false
global.azul = make_colour_rgb(0, 0, 153)

global.dormindo = false
global.trabalhando = false
global.hora_entrada_trabalho = 0

global.acao = (global.dormindo || global.trabalhando)

function valor_acao(){
	global.acao = (global.dormindo || global.trabalhando)
}