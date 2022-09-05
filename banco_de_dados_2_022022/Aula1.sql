-- comentario
SELECT  
    "USE MySQL database"
AS
    "INFO";

USE mysql;

SELECT
    "drop database aula 1 if exist"
AS 
    "INFO";

DROP DATABASE IF EXISTS aula1;

SELECT 
    "The creation of database" 
AS  
    "INFO";
   
CREATE DATABASE aula1;

SELECT
    "use of Database"
AS
    "INFO";

USE aula1;

SELECT
    "Create table alunos"
AS
    "INFO";


DROP TABLE IF EXISTS students;

CREATE TABLE students(
    id_aluno            INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name          VARCHAR(255) NOT NULL,
    last_name           VARCHAR(255) NOT NULL,
    gender              ENUM('MA', 'FE'),
    code_registration   INTEGER UNIQUE,
    status              BOOLEAN DEFAULT true,
    created_at          DATETIME DEFAULT NOW(),
    deleted_at          DATETIME
    
);

DESCRIBE students;

INSERT INTO students (
    first_name,
    last_name,
    gender,
    code_registration
)
    VALUES
(
    'Bruno',
    'Oliveira',
    'MA',
    1
),
(
    'Douglas',
    'Iving',
    'MA',
    2
),
(
    'Ernani',
    'Paz',
    'MA',
    3
);

SELECT * FROM students;

SELECT
    "select Specific collumns - version 2"
AS
    "INFO";

SELECT
    students.first_name as primeiro_nome,
    students.last_name as segundo_nome,
    students.gender as sexo  #fazendo refenrencia para aula e tabela#
FROM    
    aula1.students
WHERE
    students.first_name = 'Ernane';

