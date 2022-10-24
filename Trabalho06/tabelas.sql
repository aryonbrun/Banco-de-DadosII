CREATE DATABASE trabalho06;

USE trabalho06;

-- CRIANDO A TABELA COM A PRIMARY
CREATE TABLE aryon (
    id_nome INTEGER PRIMARY KEY AUTO_INCREMENT,
    rg VARCHAR (255) NOT NULL 
);
-- CRIANDO A TABELA COM A PRIMARY
CREATE TABLE brunetti (
    id_nome INTEGER PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR (255) NOT NULL,
    FOREIGN KEY (id_aryon) REFERENCES aryon (id_aryon)
);

 --INSERINDO VALORES

INSERT INTO aryon (rg) VALUES
    ('12346567'),
    ('76543210'),
    ('9685741'),
    ('1425369');

INSERT INTO brunetti (cpf)  VALUES
    ('05445896574', 1),
    ('02345748574', 2),
    ('12368745685', 3),
    ('12396587457', 4),
   
SELECT * FROM aryon;
SELECT * FROM brunetti;

set autocommit = 0;

START TRANSACTION;

DELETE FROM brunetti WHERE id_aryon = 2;

SELECT "BEFORE ROLLBACK" as "LOST";

SELECT * FROM brunetti;

ROLLBACK;
SELECT "AFTER ROLLBACK" AS "LOG";

SELECT  * FROM brunetti;

SET autocommit=1;

DELIMITER $$
    CREATE TRIGGER  trigger_01 AFTER INSERT ON aryon FOR EACH ROW
        BEGIN UPDATE brunetti SET cpf = ('08800099999') 
        WHERE brunetti.id_brunetti = 1;
        END $$;

DELIMITER;

INSERT INTO aryon(rg) VALUES
    ('12547859574');

SELECT * FROM brunetti;

