var conta = 0
var action = ""
var calculando = false
var resultado = false
var virgula = false

function sec(numero) {
    $(".iphone-operation").removeClass("testClick")
    if (!($("#iphoneTotal").text().length >= 8)){
        if (resultado || calculando || document.getElementById("iphoneTotal").innerHTML == "0"){
            resultado = false
            virgula = false
            calculando = false
            document.getElementById("iphoneTotal").innerHTML = ""
            reqem = document.getElementById("iphoneTotal").innerHTML;
            reqem = reqem + numero;
            document.getElementById("iphoneTotal").innerHTML = reqem;
        }else{
            reqem = document.getElementById("iphoneTotal").innerHTML;
            reqem = reqem + numero;
            document.getElementById("iphoneTotal").innerHTML = reqem;
        }
    }
}

$(".iphone-operation").on("click", function () {
    calculando = true
    conta = document.getElementById("iphoneTotal").innerHTML
    action = $(this).text()
    $(this).addClass("testClick")
    if ( $(this).text() == "="){
        $(this).removeClass("testClick")
    }
});

function noqte() {
    reqem = document.getElementById("iphoneTotal").innerHTML
    if(!virgula){
        virgula = true
        reqem = reqem + "."
        document.getElementById("iphoneTotal").innerHTML = reqem;
    }
}

function resetIphone() {
    document.getElementById("iphoneTotal").innerHTML = "0"
    resultado = true
    virgula = false
}

function azaltReqemi() {
    reqem = document.getElementById("iphoneTotal").innerHTML
    document.getElementById("iphoneTotal").innerHTML = reqem.substring(0, reqem.length - 1);
}

function menfi() { 
    reqem = document.getElementById("iphoneTotal").innerHTML;
    document.getElementById("iphoneTotal").innerHTML = reqem*-1;
}

function faiz() { 
    reqem = document.getElementById("iphoneTotal").innerHTML;
    document.getElementById("iphoneTotal").innerHTML = reqem/100;
}

function neticeIphone() {
    neticemiz = document.getElementById("iphoneTotal").innerHTML
    resultado = conta+action+neticemiz
    resultado = Number.parseFloat(eval(resultado)).toFixed(7)

    document.getElementById("iphoneTotal").innerHTML = formatarResultado(Number.parseFloat(resultado))

    action = ""
    resultado = true

    virgula = false
}


function formatarResultado(resultado){
    const quantidadeMaximaCaracter = 8
   if (resultado.toString().length > quantidadeMaximaCaracter ){ 
        if (resultado % 1 != 0){
            const resultadoIntLenght = parseInt(resultado).toString().length;
            var result
            resultadoIntLenght > quantidadeMaximaCaracter ? result = resultado.toPrecision(5) : result = resultado.toFixed(quantidadeMaximaCaracter - resultadoIntLenght)
            return result
        }else{
            return resultado.toPrecision(5);
        }
    }else{
        return resultado;
    }

}