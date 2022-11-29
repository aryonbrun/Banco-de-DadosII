-- AULA 18 28/11/22 
--AULA 16 DO GIT DO JONATHAN

DROP DATABASE IF EXISTS learn_procedures;

CREATE DATABASE learn_procedures;
SET NAMES utf8mb4;

USE learn_procedures;

CREATE TABLE country (
    id_country INTEGER AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255),
    continent VARCHAR(255)
);

INSERT INTO 
    country (country_name, continent) 
VALUES
    ('Brasil', 'América do Sul'),
    ('Paraguai', 'América do Sul'),
    ('Uruguai', 'América do Sul'),
    ('Peru', 'América do Sul'),
    ('Líbano', 'Asia'),
    ('Estados Unidos', 'América do Norte')
;

DELIMITER $$

CREATE FUNCTION TypeOfContinent(
    continent VARCHAR (255)
) RETURNS VARCHAR(255)
BEGIN
    DECLARE response VARCHAR (255) DEFAULT "NOT-DEFINED";

    IF continent = 'América do Sul' THE
        SET response = 'AS' ;
    ELSEIF continent = 'Asia' THEN
        SET response = 'A' ;
    ELSEIF continent = 'América do Norte' THEN
        SET response = 'AN' ;
    END IF;

    RETURN response;
END $$

DELIMITER ;


SELECT TypeOfContinent('América do Norte');

SELECT
    country_name,
    TypeOfContinent(continent) AS 'continent'


-- BEGIN
--   SELECT * FROM country;
-- END $$

-- DELIMITER ;


-- show procedure status;


-- DELIMITER $$

-- DROP PROCEDURE IF EXISTS  SelectCountryArgRecive;

-- CREATE  PROCEDURE SelectCountryArgRecive(CountryName VARCHAR(255))
-- BEGIN
--   SELECT 
--  	* 
--   FROM 
--  	country
--   WHERE 
--  	country.country_name=CountryName;
-- END $$

-- DELIMITER ;

-- call SelectCountryArgRecive ('Brasil');

-- DELIMITER $$

-- DROP PROCEDURE IF EXISTS  SelectCountryInternArg;

-- CREATE  PROCEDURE SelectCountryInternArg()