// RELÓGIO

function atualizarRelogio(){

    let agora = new Date();

    let hora = agora.toLocaleTimeString();

    document.getElementById("relogio").innerHTML = hora;
}

setInterval(atualizarRelogio,1000);


// PESQUISA DE PRODUTOS

function pesquisarProduto(){

    let input =
    document.getElementById("pesquisa").value.toLowerCase();

    let linhas =
    document.querySelectorAll("table tbody tr");

    linhas.forEach(linha => {

        let nome =
        linha.children[1].innerText.toLowerCase();

        if(nome.includes(input)){
            linha.style.display = "";
        }else{
            linha.style.display = "none";
        }

    });
}


// ANIMAÇÃO

window.addEventListener("scroll", ()=>{

    let cards =
    document.querySelectorAll(".card");

    cards.forEach(card=>{

        let posicao =
        card.getBoundingClientRect().top;

        if(posicao < 500){

            card.style.opacity = "1";
            card.style.transform = "translateY(0)";
        }

    });

});

// LOGIN

function entrar(event){

    event.preventDefault();

    let email =
    document.getElementById("email").value;

    let senha =
    document.getElementById("senha").value;

    if(
        email === "admin@admin.com"
        &&
        senha === "admin123"
    ){

        window.location.href =
        "estoque.html";

    }else{

        document.getElementById(
            "mensagem"
        ).innerHTML =
        "Email ou senha inválidos";

    }

}