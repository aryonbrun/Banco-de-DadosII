DROP DATABASE IF EXISTS novo_estoque;
CREATE DATABASE novo_estoque;

USE novo_estoque;

DROP TABLE IF EXISTS cargos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS clientes_produtos;
DROP TABLE IF EXISTS empresas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS usuarios_produtos;

CREATE TABLE cargos (
    id_cargo INTEGER NOT NULL PRIMARY KEY auto_increment,
    cargo VARCHAR(255)
);

DESC cargos;

CREATE TABLE usuarios (
    id_usuario INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_usuario VARCHAR(255),
    endereco_usuario VARCHAR(255),
    id_cargo INTEGER,
    FOREIGN KEY (id_cargo) REFERENCES cargos (id_cargo)
);

DESC usuarios;

CREATE TABLE empresas (
    id_empresa INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_empresa VARCHAR(255)
);

DESC empresas;

CREATE TABLE produtos (
    id_produto INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_produto VARCHAR(255) NOT NULL,
    preco_compra FLOAT NOT NULL,
    preco_venda FLOAT NOT NULL,
    quantidade INTEGER NOT NULL,
    id_empresa INTEGER NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa)
);

DESC produtos;

CREATE TABLE clientes (
    id_cliente INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(255) NOT NULL,
    cpf_cnpj_cliente VARCHAR(255) NOT NULL,
    endereco_cliente VARCHAR(13)
);

DESC clientes;

CREATE TABLE clientes_produtos (
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

DESC clientes_produtos;

CREATE TABLE usuarios_produtos (
    id_usuario INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

DESC usuarios_produtos;

INSERT INTO cargos (cargo) VALUES
("secretario"),
("vendedor"),
("gerente"),
("diretor");

SELECT * FROM cargos;

INSERT INTO usuarios (nome_usuario, endereco_usuario, id_cargo) VALUES
("Aleister Crowley"," Rua Clarendon Square",2),
("Roderick Burgess","Rua Sandman",4),
("Ozzy Osbourne","Rua War Pigs",3),
("Tony Iommi","Rua Oxford",1),
("Zakk","Rua River",2);

SELECT * FROM usuarios;

INSERT INTO empresas (nome_empresa) VALUES
("Sony"),
("Microsoft"),
("Nintendo");

SELECT * FROM empresas;

INSERT INTO produtos (nome_produto, preco_compra, preco_venda, quantidade, id_empresa) VALUES
("Playstation5", 4299, 4500, 72, 1 ),
("Switch", 1700, 2100, 35, 3 ),
("Xone", 1899, 2200, 10, 2 ),
("Seriesx", 3999, 4500, 25, 2 ),
("Playsation4", 1500, 2000, 21, 1 ),
("NintendoDs", 500, 800, 40, 3 );

SELECT * FROM produtos;

INSERT INTO clientes (nome_cliente, cpf_cnpj_cliente, endereco_cliente) VALUES
("Henrique","15945395974","Rua Bernardino Borman"), 
("Victor","12597466984","Avenida Coronel");

SELECT * FROM clientes;

INSERT INTO clientes_produtos (id_cliente, id_produto) VALUES
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Henrique'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playstation5')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Henrique'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playsation4')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Victor'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'NintendoDs')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Henrique'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Switch')         
    );

SELECT * FROM clientes_produtos;

INSERT INTO usuarios_produtos (id_usuario, id_produto) VALUES
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Aleister Crowley'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playstation5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Roderick Burgess'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playsation4')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Tony Iommi'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Seriesx')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Roderick Burgess'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xone')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ozzy Osbourne'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'NintendoDs')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Zakk'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Switch')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Ozzy Osbourne'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = '')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Zakk'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playstation5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Aleister Crowley'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Playsation4')         
    );

SELECT * FROM usuarios_produtos;

SELECT

    "EXERCICIO1" AS MESSAGE_LOG;

SELECT 
    (
        SELECT 
            nome_cliente 
        FROM 
            clientes 
        WHERE 
            id_cliente = (
                SELECT 
                    id_cliente 
                FROM 
                    clientes_produtos 
                WHERE 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) AS nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra
FROM 
    produtos 
WHERE 
    id_produto IN (
        SELECT
            id_produto 
        FROM 
            clientes_produtos
)
LIMIT
    3;

SELECT

    "EXERCICIO2" AS MESSAGE_LOG;

select 
    (
        SELECT 
            nome_cliente 
        FROM 
            clientes 
        WHERE 
            id_cliente = (
                SELECT 
                    id_cliente 
                FROM 
                    clientes_produtos 
                WHERE 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) AS nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
FROM 
    produtos 
WHERE 
    id_produto IN (
        SELECT 
            id_produto 
        FROM 
            clientes_produtos
)
ORDER BY
    produtos.quantidade DESC;

SELECT

    "EXERCICIO3" AS MESSAGE_LOG;

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
FROM
    clientes 
INNER JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
INNER JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
INNER JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;

SELECT

    "EXERCICIO4" AS MESSAGE_LOG;

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
FROM
    clientes 
LEFT JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
LEFT JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
LEFT JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;
