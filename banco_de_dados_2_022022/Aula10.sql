-- CRIE UMA tabela de carros com as seguintes colunas

-- nome, modelo, ano 

-- Insira
-- Chevette, Chevrolet,  1995
-- Gol, Volkswaggen, 2010
-- Onix, Chevrolet, 2020

-- Crie uma tabela de vendedores com as seguintes colunas

-- id_vendedor, nome, sobrenome, cpf

-- jose, Silva, xxx.xxx.xxx-xx
-- Fabio, Lima, xxx.xxx.xxx-xx


-- Cria uma tabela de compradores com as seguintes colunas

-- id_comprador, nome, sobrenome, cpf

-- Odair, Silveira, xxx.xxx.xxx-xx

-- Crie um tabela que relaciona compradores vendedores e carros

-- comp_vend_carro
-- id_comp_vend_carro, id_compradores, id_vendedor, id_comp_vend_carro

-- Crie uma view que retorna todos os carros que transações, POr linha deve haver;

-- nome do carro, modelo do carro, ano do carro, nome do vendedor, nome do comprador.


DROP DATABASE IF EXISTS aula10sh;
CREATE DATABASE aula10sh;

USE aula10sh;

CREATE TABLE carros (

    id_carro INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    modelo VARCHAR(255),
    ano INTEGER

);

INSERT INTO
    carros (nome, modelo, ano)
VALUES
    ('Chevette', 'Chevrolet', 1995),
    ('Gol', 'Volkswagen', 2010),
    ('Onix', 'Chevrolet', 2020);

SELECT * FROM carros;

CREATE TABLE vendedores (
    id_vendedor INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    cpf VARCHAR(255)
);

INSERT INTO
    vendedores (nome, sobrenome, cpf)
VALUES
    ('jose', 'silva' , 'xxx.xxx.xxx-xx'),
    ('Fabio', 'lima', 'xxx.xxx.xxx-xx');

CREATE TABLE compradores (
    id_comprador INTEGER PRIMARY KEY NOT NULL  AUTO_INCREMENT,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    cpf VARCHAR(255)
);

INSERT INTO 
    compradores (nome, sobrenome, cpf)
VALUES
    ('Odair', 'Silva', 'xxx.xxx.xxx-xx');

CREATE TABLE comp_vend_carro (
    id_comp_vend_carro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_comprador INTEGER,
    FOREIGN KEY (id_comprador) REFERENCES compradores (id_comprador),
    id_vendedor INTEGER,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores (id_vendedor),
    id_carro INTEGER,
    FOREIGN KEY (id_carro) REFERENCES carros(id_carro)
);


INSERT INTO
    comp_vend_carro (id_comprador, id_vendedor, id_carro)
VALUES
    (
        (SELECT id_comprador FROM compradores WHERE nome - 'Odair'),
        (SELECT id_vendedor FROM vendedores WHERE nome - 'Jose'),
        (SELECT id_carro FROM carros WHERE nome - 'Gol')
    );


-- CRIANDO A VIEW
CREATE
    VIEW transaction_cars
    
as (
SELECT --CRIANDO AS E DANDO NOME PARA COLUNA
    compradores.nome as comprador,
    compradores.sobrenome as sobrenome_comprador,
    compradores.cpf as cpf_comprador,
    vendedores.nome as vendedor,     
    vendedores.sobrenome as sobrenome_vendedor,
    vendedores.cpf as cpf_vendedor,
    carros.nome as nome_carro,
    carros.modelo as modelo_carro,
    carros.ano as ano_carro

FROM comp_vend_carro

INNER JOIN
    compradores
    ON id_comp_vend_carro.id_comprador = compradores.id_comprador
INNER JOIN
    vendedores
    ON comp_vend_carro.id_vendedor = vendedores.id_vendedor
INNER JOIN 
    carros
    ON comp_vend_carro.id_carro = carros.id_carros
);
















