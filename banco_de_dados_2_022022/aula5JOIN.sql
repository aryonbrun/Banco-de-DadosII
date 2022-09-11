CREATE DATABASE IF NOT EXISTS aprender_join
CHARACTER SET utf8mb4;
USE aprender_join;

DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS estado;

CREATE TABLE IF NOT EXISTS estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM ('sul', 'sudeste', 'centro-oeste', 'norte', 'nordeste')
);

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

INSERT INTO
    estado (nome, regiao)
VALUES
    ('Parana', 'sul'),
    ('Sao Paulo', 'sudeste'),
    ('Rio de Janeiro', 'sudeste'),
    ('Bahia','nordeste'),
    ('Pernambuco', 'nordeste'),
    ('Para', 'norte'),
    ('Mato Grosso', 'centro-oeste');

SET @idParana:= (SELECT id_estado FROM estado WHERE estado.nome = 'Parana');
SET @idSaoPaulo:= (SELECT id_estado FROM estado WHERE estado.nome = 'Sao Paulo');
SET @idRioDeJaneiro:= (SELECT id_estado FROM estado WHERE estado.nome = 'RioDeJaneiro');
SET @idBahia:=(SELECT id_estado FROM estado WHERE estado.nome = 'Bahia');
SET @idPernambuco:=(SELECT id_estado FROM estado WHERE estado.nome = 'Pernambuco');
SET @idPara:=(SELECT id_estado FROM estado WHERE estado.nome = 'Para');
SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = 'Mato Grosso');

INSERT INTO 
    cidade(nome, id_estado) 
VALUES       
    ("Curitiba", @idParana),
    ("Sao Paulo", @idSaoPaulo),
    ("Rio de janeiro", @idRioDeJaneiro),
    ("Salvador", @idBahia),
    ("Recife", @idPernambuco),
    ("Belem", @idPara),
    ("Cuiaba", @idMatoGrosso),

SELECT *
FROM estado
WHERE regiao = 'sul' OR regiao = 'sudeste';

SELECT estado.nome
FROM estado 
WHERE estado.id_estado = (
    SELECT cidade.id_estado 
    FROM cidade 
    WHERE cidade.nome = "lanapqp");

SELECT 
    *
FROM 
    cidade
INNER JOIN 
    estado 
ON 
    cidade.id_estado = estado.id_estado --  FAZER COM FOREIGN KEY COM PRIMARY KEY
WHERE
    cidade.nome = "Manaus";

CREATE TABLE restaurantes(
    id_restaurante INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255), 
    descricao VARCHAR(255),
    id_cidade INTEGER NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

SET @idCuritibaCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Curitiba');
SET @idSaoPauloCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Sao Paulo');
SET @idRioDeJaneiroCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Rio de Janeiro');
SET @idBrasiliaCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Brasilia');
SET @idNiteroiCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Niteroi');


INSERT INTO 
    restaurantes(nome, descricao, id_cidade)
VALUES
    ("Mineirinha", "Comer uma mineirinha eh daora", @idCuritibaCidade),
    ("Fogo de Chao", "Churrasco com um pouco de terra", @idCuritibaCidade),
    ("Carlitos Pizzaria", "Pizzaria tradicional mais moderna da cidade", @idSaoPauloCidade),
    ("Cantina do Senac", "Pior cantina do mundo", @idBrasiliaCidade),
    ("El Patron", "Comida Mexicana do Paraguai", @idRioDeJaneiroCidade),
    ("Tchaca Tchaca na Butchaca", "Comida fresquinha tailandesa", @idBrasiliaCidade),
    ("Assuquinha", "Formigas e Abelhas são bem vindas", @idSaoPauloCidade);
    
SELECT 
    *
FROM
    restaurantes
WHERE id_cidade = 
    (SELECT 
        cidade.id_cidade 
    FROM 
        cidade 
    WHERE 
        cidade.id_cidade = @idBrasiliaCidade);

-- CRIAR JOIN ENTRE RESTAURANTE E CIDADE com WHERE pelo nome do restaurante
SELECT 'Restaurantes primeiro' AS INFO;

SELECT 
    *
FROM 
    restaurantes
INNER JOIN 
    cidade 
ON 
    cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = "Carlitos Pizzaria";



        -- INVERTENDO O JOIN

SELECT 
    'Cidades primeiro' AS INFO;
SELECT 
    *
FROM 
    cidade
INNER JOIN 
    restaurantes 
ON 
    cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = "Carlitos Pizzaria";

SELECT
    'Controlando as colunas' AS INFO;

SELECT
    t1.nome_da_cidade,
    t1.nome_do_restaurante
FROM -- SUBSELECT COM INNERJOIN GERA UMA NOVA TABELA
    (SELECT
        cidade.nome AS nome_da_cidade,
        restaurantes.nome AS nome_do_restaurante,
        restaurantes.descricao AS descricao_do_restaurante
    FROM 
        cidade
    INNER JOIN 
        restaurantes
            ON restaurantes.id_cidade = cidade.id_cidade
    WHERE
        restaurantes.nome LIKE '%CAR%'
    ) AS t1
        WHERE
        t1.nome_da_cidade = 'Sao Paulo';

        -- O MESMO COMPORTAMENTO DE PULAR ENTRE AS TABELAS COM SUBSELECTS PODEMOS ALCANÇAR COM INNERJOINS
        
SELECT 'Inner Join dentro de Inner Join' AS "INFO";
SELECT
    cidade.nome AS nome_da_cidade,
    estado.nome AS nome_do_estado,
    restaurantes.nome AS nome_do_restaurante
FROM 
    restaurantes
INNER JOIN
    cidade
        ON restaurantes.id_cidade = cidade.id_cidade
    INNER JOIN 
        estado
            ON cidade.id_estado = estado.id_estado
WHERE
    restaurantes.nome LIKE "Tcha%";