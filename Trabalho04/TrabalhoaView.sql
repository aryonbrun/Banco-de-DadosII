CREATE DATABASE trabalho04;

USE trabalho04;

-- CRIANDO A TABELA COM A PRIMARY
CREATE TABLE pais (
    id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL 
);
-- CRIANDO A TABELA COM A PRIMARY
CREATE TABLE cidade (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    id_pais INTEGER NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

 --INSERINDO VALORES

INSERT INTO pais (nome) VALUES
    ('EastBlue'),
    ('WestBlue'),
    ('NorthBlue'),
    ('SouthBlue');

INSERT INTO cidade (nome, id_pais) VALUES
    ('Vila Foosh', 1),
    ('Mt. Colubo', 1),
    ('Termina Cinza', 1),
    ('Goa', 1),
    ('Ohara', 2),
    ('Ilusia', 2),
    ('Toroa', 2),
    ('Thriller Bark', 2),
    ('Lvneel', 3),
    ('Micqueot', 3),
    ('Flevance', 3),
    ('Ilha Rubeck', 3),
    ('Centaurea', 4),
    ('Reino Torino', 4),
    ('Baterilla', 4),
    ('Reino Briss', 4);


-- CRIANDO A VIEW

CREATE VIEW
    view_onepiece

AS (
    SELECT pais.nome AS pais_nome, 
    pais.id_pais AS pais_id, 
    cidade.nome AS cidade_nome, 
    cidade.id_cidade AS cidade_id, 
    cidade.id_pais AS cidade_id_pais 
    
    FROM pais

    INNER JOIN cidade ON pais.id_pais = cidade.id_pais
)   

    ORDER BY cidade_id ASC;

SELECT * FROM view_onepiece;