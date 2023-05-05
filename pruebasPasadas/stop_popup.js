function abrir_ventana(){
    window.open("http://www.youtube.com/");
}

function parar_abrir(){
    clearTimeout(pop);
}
pop = setInterval("abrir_ventana()", 3000)
