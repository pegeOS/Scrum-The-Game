//randomizando os codigos que aparecem
randomize()

codigos = [
    "print('Hello World')",
    "var valor = 5", 
    "while (True) { print( ' Nao aguento mais trabalhar ')}", 
    "<p>Scrum, uma metodologia agil perfeita</p>",
    "function soma(a,b) { return a + b }", 
    "for( int i = 0; i < 10; i++ ) { print(i) }"
]

//pegando um codigo aleatorio da array
aleatorio = codigos[irandom(array_length(codigos) - 1)]

//criando uma variavel que armazena o que o player digita
digitando = ""