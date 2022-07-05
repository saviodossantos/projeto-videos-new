// jquery para excluir um item e limpar o carrinho inteiro 
$().ready(function () {
    $('.bt-limparCarrinho').click(function () {
        let dataid = $(this).attr('data-id')
        $.post("/delete-all-carrinho", {
            carrinho_id: dataid
        },
        function (data, status) {
            alert("Carrinho limpo com sucesso.")
            location.href = '/carrinho'
        }, 'json')
    })

    $('.btn-excluir').click(function () {
        let dataid = $(this).attr('data-id')

        $.post("/delete-carrinho", {
            carrinho_id: dataid
        },
            function (data, status) {
                alert("Filme removido do carrinho.")
                location.href = '/carrinho'
            }, 'json')
    })
    
})

// ======================================== fim do jquery ========================================

let carrinho = [
    '{"produto":["filme1","filme2","filme3"],"nome":["The Batman","Doutor Estranho: Multiverso da Loucura","Matrix 4"],"qtd":["1","1","1"],"preco":[20,30,10]}'
]
// let carrinhoJSON = JSON.parse(carrinho)
let listaCarrinho = document.querySelector("#listaCarrinho")
let totalProdutos = document.querySelector("#totalProdutos")
let valor = document.querySelector("#valorTotal")
let conteudoCarrinho = document.querySelector("#conteudoCarrinho")

let totalCarrinho = document.querySelector("#totalCarrinho")
let totalItens = document.querySelector("#totalItens")
let totalItensResult = document.querySelector("#totalItensResult")
var p = document.createElement("p")

totalCarrinho.style.border = "1px solid white"
totalCarrinho.style.borderRadius = "1rem"

totalCarrinho.appendChild(p)

//cupom de desconto ======================================================
var Cupom10 = '10MENOS'
var Cupom20 = '20MENOS'
var DESCONTO1 = ("20")
var DESCONTO2 = ("10")

let cupom = document.querySelector("#cupom")

let totalDesconto = document.querySelector("#totalDesconto")
totalDesconto.style.display = "none"

let valor1 = document.querySelector("#TOTAL") // Cupom20

var PORCENTAGEM = parseInt((valorTotal * DESCONTO1) / 100);
var TOTAL = parseInt((valorTotal - PORCENTAGEM))

var PORCENTAGEM2 = parseInt((valorTotal * DESCONTO2) / 100);
var TOTAL2 = parseInt((valorTotal - PORCENTAGEM2))

// calcular cupom ======================================================

document.querySelector("#calcularCupom").onclick = function () {
    if (totalDesconto.style.display == "none") {

        if (cupom.value == Cupom20) {
            alert("Você ganhou 20% de desconto.")
            totalDesconto.style.display = ""
        } else if (cupom.value == Cupom10) {
            alert("Você ganhou 10% de desconto.")
            totalDesconto.style.display = ""
        } else {
            alert("Código incorreto ou expirado.")
        }

    } else {
        alert("Você já tem um desconto aplicado.")
    }

}

//calcular porcentagem ======================================================
function calcularPorcentagem() {
    for (i = 0; i < carrinhoJSON.produto.length; i++) {
        let qtdTelas = document.querySelector("#qtdTelasfilme<%= item.filmes_id %>")
        // let qtdTelasValue = document.querySelector(qtdTelas.value)

        let percent = 0.07

        let pct = (qtdTelas.value + carrinhoJSON.preco[0] * percent)
        // let pct1 = (qtdTelas2.value * carrinhoJSON.preco[1] * 0.07)
        // let pct2 = (qtdTelas3.value * carrinhoJSON.preco[2] * 0.07)
        // let pctTotal = (qtdTelas.value * carrinhoJSON.preco[0] * 0.07) + (qtdTelas2.value * carrinhoJSON.preco[1] * 0.07) + (qtdTelas3.value * carrinhoJSON.preco[2] * 0.07)


        valor.innerHTML = pct + valorTotal

        qtdTelas.addEventListener('change', calcularPorcentagem)
    }
}


// lógica para cada value do id do input de qtdTelas ser impresso
// for (i = 0; i < carrinhoJSON.produto.length; i++) {
//     let qtdTelas = document.querySelector("#qtdTelas" + carrinhoJSON.produto[i])
//     qtdTelas.addEventListener('change', calcularPorcentagem)
// }





function q(el) {
    return document.querySelector(el)
}


function calcularCarrinho() {
    valorTotal = parseFloat(q("#preco" + carrinhoJSON.produto[0]).innerHTML) + parseFloat(q("#preco" + carrinhoJSON.produto[1]).innerHTML) + parseFloat(q("#preco" + carrinhoJSON.produto[2]).innerHTML)

    valor.innerHTML = valorTotal
}

function alteraCarrinho() {
    q("#preco" + carrinhoJSON.produto[0]).innerHTML = (parseFloat(q("#preco" + carrinhoJSON.produto[0]).innerHTML) * q("#qtdTelas" + carrinhoJSON.produto[0]).value)

    calcularCarrinho();
}

calcularCarrinho()

document.querySelector("#qtdTelas" + carrinhoJSON.produto[0]).addEventListener("change", alteraCarrinho)
