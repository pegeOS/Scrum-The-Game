
global.progresso = 0
global.nivel_conhecimento = 0 //associada a barra de conhecimento e bonus de progresso


global.tutorial_pc = false
global.veio_do_tutorial = false
global.azul = make_colour_rgb(0, 0, 153)

global.dormindo = false
global.trabalhando = false
global.aprender = false;

global.hora_entrada_trabalho = 0
global.hora_entrada_cama = 0
global.hora_entrada_livros = 0


global.acao = (global.dormindo || global.trabalhando || global.aprender)

function valor_acao(){
	global.acao = (global.dormindo || global.trabalhando || global.aprender)
}

global.dia_atual = 1
global.dia_maximo = 7
global.dia_avancando = false
global.transicao_dia = 0
global.aparece_tempo = true
global.progresso_conhecimento = 10
global.daily_pendente = false

function iniciar_nova_sprint() {
    global.dia_atual = 1
    global.progresso = 0
    global.tempo_decorrido = 0
    global.progresso_dia = 0
    global.dormindo = false
    global.trabalhando = false
    global.aprender = false
    global.dia_avancando = false

    // energia cheia de novo (o obj_barra_energia é persistente)
    if (instance_exists(obj_barra_energia)) {
        obj_barra_energia.energy = obj_barra_energia.segment_max
    }

    // mesma sequência do botão "Jogar": tela "DIA 1" e vai pro quarto
    if (!instance_exists(obj_transicao_dia)) {
        instance_create_layer(0, 0, "Instances", obj_transicao_dia)
    }
    obj_transicao_dia.inicio_jogo()
    room_goto(rm_quarto)
}