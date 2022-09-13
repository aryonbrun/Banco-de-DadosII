CREATE DATABASE leftouter;

USE leftouter;

CREATE TABLE B (
    id_b INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_b VARCHAR(255)
);

CREATE TABLES A (
    id_a INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_a VARCHAR(255),
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES b(id_B)
);

--INSEERINDO NA TABELA
INSERT INTO B (name_b) VALUES ()
('q'), 
('w'), 
('e'), 
('r'), 
('t'), 
('y'), 
('u');

INSERT INTO a (name_a, id_b) VALUES()
('a')   (SELECT id_b FROM b WHERE name_b = 'q'), -- QUANDO TRABALHAR SINTAXE SEMPRE PASSAR OS ()
('s')   (SELECT id_b FROM b WHERE name_b = 'r'),
('d')   NULL, 
('f')   (SELECT id_b FROM b WHERE name_b = 't'), 
('g')   NULL, 
('h')   NULL, 
('j')   NULL, 
('k')   (SELECT id_b FROM b WHERE name_b = 'u'), 
('l')   NULL;


SELECT * FROM A;

SELECT * FROM B;

SELECT b.id_b from b WHERWE id_b NOT IN (SELECT b.id_b FROM b INNER JOIN a ON b.id_b = a.id_b
);