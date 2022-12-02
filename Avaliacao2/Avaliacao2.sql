DROP DATABASE IF EXISTS avaliacao2;

CREATE DATABASE IF NOT EXISTS avaliacao2;


USE avaliacao2;

-- CRIANDO A TABELA COM A PRIMARY
DROP TABLE IF EXISTS aryon;
DROP TABLE IF EXISTS brunetti;

CREATE TABLE aryon (
    id_aryon INTEGER PRIMARY KEY AUTO_INCREMENT,
    rg VARCHAR (255) NOT NULL 
);
-- CRIANDO A TABELA COM A PRIMARY
CREATE TABLE brunetti (
    id_brunetti INTEGER PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR (255) NOT NULL,
    id_aryon INTEGER,
    FOREIGN KEY (id_aryon) REFERENCES aryon (id_aryon)
);
-- INSERINDO VALORES
INSERT INTO aryon (rg) VALUES
    ('12346567'),
    ('76543210'),
    ('9685741'),
    ('1425369');

INSERT INTO brunetti (cpf,id_aryon)  VALUES
    ('05445896574', 1),
    ('02345748574', 2),
    ('12368745685', 3),
    ('12396587457', 4);
   
SELECT * FROM aryon;
SELECT * FROM brunetti;

set autocommit = 0;

START TRANSACTION;

DELETE FROM brunetti WHERE id_aryon = 2;

SELECT "BEFORE ROLLBACK" as "INFO";

SELECT * FROM brunetti;

ROLLBACK;
SELECT "AFTER ROLLBACK" AS "INFO";

SELECT  * FROM brunetti;

SET autocommit=1;


DELIMITER //
    CREATE TRIGGER trigger_01 AFTER INSERT ON aryon 
    FOR EACH ROW
    BEGIN 
        UPDATE brunetti SET cpf = ('08800099999') WHERE brunetti.id_brunetti = 1;
    END //

DELIMITER ;


INSERT INTO aryon (rg) VALUES
    ('93480740');
