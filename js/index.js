
var videos = [
    ["filme1.jpeg"],
    ["filme2.jpeg"],
    ["filme3.jpeg"],
    ["filme4.jpeg"],
    ["filme5.jpeg"],
    ["filme6.jpeg"],
    ["filme7.jpeg"],
    ["filme8.jpeg"],
    ["filme9.jpeg"]
]

var galeriaVideos = document.querySelector("#galeriaVideos") //var galeria acessa div com id galeria



for (var i = 0; i < videos.length; i++) { //lógica de iteração para consumo do array

    var single = 'single.html'

    var conteudo = document.createElement('div')
    conteudo.classList.add('col-sm-4')
    conteudo.classList.add('mt-5')

    conteudo.innerHTML += '<a href="docs/' + single + '"><img src="imgs/' + videos[i] + '" class="imagens"></a>'
    galeriaVideos.appendChild(conteudo)
}


for (var i = 0; i < videos.length; i++) { //lógica de iteração para consumo do array

    if(i < 3 ){
        var singlePreferencia = 'single-preferencia.html'
    
        var conteudo = document.createElement('div')
        conteudo.classList.add('col-sm-4')
        conteudo.classList.add('mt-5')
    
        conteudo.innerHTML += '<a href="docs/' + singlePreferencia + '"><img src="imgs/' + videos[i] + '" class="imagens"></a>'
        videosRecentes.appendChild(conteudo)

    }
}
