#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Produto {

    int id;
    char nome[50];
    int quantidade;
    float preco;

};

int main() {

    struct Produto produtos[100];

    int total = 0;
    int opcao;

    do {

        printf("\n===== CONTROLE DE ESTOQUE =====\n");

        printf("1 - Cadastrar Produto\n");
        printf("2 - Listar Produtos\n");
        printf("0 - Sair\n");

        printf("Escolha: ");
        scanf("%d", &opcao);

        switch(opcao) {

            case 1:

                if(total >= 100) {

                    printf("\nLimite de produtos atingido!\n");
                    break;

                }

                printf("\nID: ");
                scanf("%d", &produtos[total].id);

                // limpa buffer
                while(getchar() != '\n');

                printf("Nome: ");
                fgets(produtos[total].nome, 50, stdin);

                // remove ENTER do nome
                produtos[total].nome[strcspn(produtos[total].nome, "\n")] = '\0';

                printf("Quantidade: ");
                scanf("%d", &produtos[total].quantidade);

                printf("Preco: ");
                scanf("%f", &produtos[total].preco);

                total++;

                printf("\nProduto cadastrado!\n");

                break;

            case 2:

                if(total == 0) {

                    printf("\nNenhum produto cadastrado!\n");
                    break;

                }

                printf("\n===== PRODUTOS =====\n");

                for(int i = 0; i < total; i++) {

                    printf("\nID: %d\n", produtos[i].id);
                    printf("Nome: %s\n", produtos[i].nome);
                    printf("Quantidade: %d\n", produtos[i].quantidade);
                    printf("Preco: R$ %.2f\n", produtos[i].preco);

                }

                break;

            case 0:

                printf("\nSaindo...\n");
                break;

            default:

                printf("\nOpcao invalida!\n");

        }

    } while(opcao != 0);

    return 0;
}