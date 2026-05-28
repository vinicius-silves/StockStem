CREATE DATABASE stockstem;
USE stockstem;
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(50)
);
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    data_pedido DATE DEFAULT (CURRENT_DATE),
    id_cliente INT,
    id_funcionario INT,

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
);
CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);
CREATE TABLE entradas (
    id_entrada INT PRIMARY KEY,
    data_entrada DATE DEFAULT (CURRENT_DATE),
    id_produto INT,
    id_fornecedor INT,
    quantidade INT NOT NULL,
    valor_compra DECIMAL(10,2),

    CONSTRAINT fk_entrada_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT fk_entrada_fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedores(id_fornecedor)
);
CREATE TABLE saidas (
    id_saida INT PRIMARY KEY,
    data_saida DATE DEFAULT (CURRENT_DATE),
    id_produto INT,
    quantidade INT NOT NULL,
    motivo VARCHAR(100),

    CONSTRAINT fk_saida_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

INSERT INTO clientes VALUES
(1, 'João Silva', '123.456.789-00', '(11)99999-1111', 'joao@email.com'),
(2, 'Maria Oliveira', '987.654.321-00', '(11)99999-2222', 'maria@email.com'),
(3, 'Carlos Souza', '456.123.789-00', '(11)99999-3333', 'carlos@email.com');



INSERT INTO funcionarios VALUES
(1, 'Ana Costa', 'Caixa', 2500.00),
(2, 'Pedro Lima', 'Gerente', 4500.00),
(3, 'Juliana Alves', 'Repositor', 2200.00),
(4, 'Lucas Ferreira', 'Caixa', 2400.00),
(5, 'Fernanda Rocha', 'Atendente', 2300.00),
(6, 'Ricardo Mendes', 'Estoquista', 2600.00),
(7, 'Patricia Gomes', 'Repositor', 2200.00),
(8, 'Bruno Martins', 'Supervisor', 3800.00);


INSERT INTO produtos VALUES
(1, 'Arroz 5kg', 'Alimentos', 25.90, 100),
(2, 'Feijão 1kg', 'Alimentos', 8.50, 200),
(3, 'Refrigerante 2L', 'Bebidas', 9.99, 80),
(4, 'Leite Integral', 'Laticínios', 5.49, 150),
(5, 'Sabonete', 'Higiene', 2.99, 300),
(6, 'Macarrão 500g', 'Alimentos', 4.99, 120),
(7, 'Óleo de Soja 900ml', 'Alimentos', 7.89, 90),
(8, 'Café 500g', 'Bebidas', 15.50, 70),
(9, 'Açúcar 1kg', 'Alimentos', 5.20, 140),
(10, 'Detergente', 'Limpeza', 2.50, 180),
(11, 'Papel Higiênico 12un', 'Higiene', 18.90, 60),
(12, 'Margarina 500g', 'Laticínios', 6.75, 85),
(13, 'Biscoito Recheado', 'Alimentos', 3.99, 200),
(14, 'Suco Caixa 1L', 'Bebidas', 7.20, 95),
(15, 'Shampoo 350ml', 'Higiene', 14.90, 50);



INSERT INTO fornecedores VALUES
(1, 'Distribuidora Alimentos Brasil', '12.345.678/0001-10',
'(11)4000-1111', 'contato@dabrasil.com', 'São Paulo'),

(2, 'Bebidas Express', '98.765.432/0001-20',
'(11)4000-2222', 'vendas@bebidasexpress.com', 'Campinas'),

(3, 'Higiene Total', '55.666.777/0001-30',
'(11)4000-3333', 'atendimento@higienetotal.com', 'Guarulhos'),

(4, 'Alimentos Brasil Distribuição', '11.222.333/0001-44',
'(11)4010-1000', 'contato@alimentosbrasil.com', 'São Paulo');