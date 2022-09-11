DROP DATABASE IF EXISTS aprendendoleft;
CREATE DATABASE aprendendoleft;


DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS classe;

CREATE TABLE classe (
    id_class INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ano VARCHAR(4) NOT NULL,
    descricao TEXT,
    ano VARCHAR(4) NOT NULL
);

CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(255) NOT NULL,
    id_classe VARCHAR(20),
    FOREIGN KEY(id_classes) REFERENCES classe(id_classe)
);

CREATE TABLE professores (
    id_professor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(10) NOT NULL,
    id_classes INTEGER NOT NULL,
    FOREIGN KEY(id_classes) REFERENCES classe(id_classe)
);

INSERT INTO classe (nome_classes, descricao, ano) VALUES
('A', 'turma que entrou no inicio do ano', '2021'),
('B', 'turma que entrou no meio do ano', '2021');

INSERT INTO alunos (nome, sobrenome, documento, id_classe) VALUES
('Bruno', 'Sobrenome do Bruno', 'xx.xxx.xxx.x',1),
('Bryan', 'Sobrenome do Bryan', 'xx.xxx.xxx.x',1),
('Leandro', 'Sobrenome do Leandro', 'xx.xxx.xxx.x',1),
('Luan', 'Sobrenome do Luan', 'xx.xxx.xxx.x',1),
('Lucas', 'Sobrenome do Lucas', 'xx.xxx.xxx.x',2),
('Aryon', 'Sobrenome do Aryon', 'xx.xxx.xxx.x',2),
('Raphael', 'Sobrenome do Raphael', 'xx.xxx.xxx.x',2),
('Leticia', 'Sobrenome do Leticia', 'xx.xxx.xxx.x',2),
('Pedro', 'Sobrenome do Pedro', 'xx.xxx.xxx.x',2),
('Guilher', 'Sobrenome do Guilher', 'xx.xxx.xxx.x',2)

INSERT INTO aluno (nome, sobrenome, documento) VALUES
('Ernani', 'Sobrenome do Ernani', 'xx.xxx.xxx.x')

SELECT 'ALUNOS - INNER JOIN' AS 'LOG';

SELECT 
    alunos.nome
FROM
    alunos
INNER JOIN 
    classe
     ON aluno.id_classe = classe.id_classe;


SELECT 'ALUNOS - INNER JOIN' AS 'LOG';

SELECT 
    alunos.nome
FROM
    alunos
INNER JOIN 
    classe
     ON aluno.id_classe = classe.id_classe;