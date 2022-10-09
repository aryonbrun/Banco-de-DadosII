-- PRIMEIRA AULA DO SEGUNDO BIMESTRE
-- MATERIA NOVA 

USE sakila;

SELECT 'creating a view' as 'log'; -- CRIANDO A VIEW 

CREATE 
    VIEW select_all_actors -- SELECIONANDO AS COLUNAS
AS ( 
    SELECT actor.first_name, actor.last_name. actor.last_update FROM actor
    WHERE actor.first_name LIKE "C%"
);

SELECT 'using' as 'log';

SELECT * FROM select_all_actors;

-- PROCEDIMENTO == NAO PRECISA TER RETORNO

-- FUNÇÃO == RETORNO