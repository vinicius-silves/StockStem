#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Produto{

    int id;
    char nome[50];
    int quantidade;
    float preco;

};

int main(){

    struct Produto produtos[100];

    int total = 0;

    int opcao;

    do{

        printf("\n===== CONTROLE DE ESTOQUE =====\n");

        printf("1 - Cadastrar Produto\n");

        printf("2 - Listar Produtos\n");

        printf("0 - Sair\n");

        printf("Escolha: ");

        scanf("%d", &opcao);

        switch(opcao){

            case 1:

                printf("\nID: ");
                scanf("%d",&produtos[total].id);

                printf("Nome: ");
                scanf("%s",produtos[total].nome);

                printf("Quantidade: ");
                scanf("%d",&produtos[total].quantidade);

                printf("Preco: ");
                scanf("%f",&produtos[total].preco);

                total++;

                printf("\nProduto cadastrado!\n");

                break;

            case 2:

                printf("\n===== PRODUTOS =====\n");

                for(int i=0; i<total; i++){

                    printf("\nID: %d",
                    produtos[i].id);

                    printf("\nNome: %s",
                    produtos[i].nome);

                    printf("\nQuantidade: %d",
                    produtos[i].quantidade);

                    printf("\nPreco: %.2f\n",
                    produtos[i].preco);

                }

                break;

            case 0:

                printf("\nSaindo...\n");

                break;

            default:

                printf("\nOpcao invalida!\n");

        }

    }while(opcao != 0);

    return 0;
}