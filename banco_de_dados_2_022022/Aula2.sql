SELECT 
    "specific select on costumer table"
AS  
    "INFO";


SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
LIMIT 15;


SELECT 
    'select some specific people with or'
AS
    'INFO';



SELECT
    customer.costumer_id.
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'MARY' or
    customer.first_name = 'PATRICIA'
LIMIT 15;

SELECT
    'select some specific people with and'
AS
    'INFO';

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'MARY' and
    customer.first_name = 'PATRICIA'
LIMIT 15;


SELECT
    'select some specific people with and that works'
AS
    'INFO';

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM
    customer
WHERE
    customer.first_name = 'WADE' and
    customer.email = 'WADE.DELVALLE@sakilacostumer.org'
LIMIT 15;

SELECT
    'especific selects of films'
AS
    'INFO';


SELECT
    film.rating,
    film.title,
    film.description,
    film.lenght,
    film.language_id,
    filme.release_year
FROM
    film
WHERE
    (film.release_year > 2000 AND film.release_year < 2010) AND
    (film.lenght > 70 AND film.lenght < 80) AND
    (film.language_id = i OR film.language_id = 5) AND
    (film.rating = 'G' OR film.rating = "R" OR film.rating = 'NC-17')
LIMIT 40;


SELECT
    'USE OF in'
AS
    'INFO';


SELECT
    film.rating.
    film.title,
    film.description,
    film.lenght,
    film.language_id,
    film.release_year
FROM
    film
WHERE
    (film.release_year > 2000 AND film.release_year < 2010) AND
    (film.lenght > 70 AND film.lenght < 80) AND
    (film.language_id IN (1,5)) AND
    (film.rating IN ('G', 'R', 'NC-17'))
LIMIT 40;


SELECT 
    'Introducing to sub Query'
AS
    'INFO';


SELECT 
    film.rating,
    film.title,
    film.description,
    film.lenght,
    film.language_id,
    film.release_year
FROM
    film
WHERE
    (film.release_year BETWEEN 2000 AND 2010) AND
    (film.lenght BETWEEN 70 AND 80) AND
    (film.language_id IN (1,5)) AND
    (film.rating IN ('G','R','NC-17'))
LIMIT 40;


SELECT 
    'Introduction To Sub Query'
AS 
    'INFO';


SELECT
    film.rating,
    film.title,
    film.description,
    film.lenght,
    film.language_id
    film.release_year
FROM
    film
WHERE
    (film.release_year BETWEEN 2000 AND 2010) AND
    (film.length BETWEEN 70 AND 80) AND
    (film.language_id IN (
        (
            SELECT
                language_id
            FROM
                language
            WHERE
                name = 'french'
        ),
        (
            SELECT
                language_id
            FROM
                language
            WHERE
                name = 'italian'
        ),
        (
            SELECT 
                language_id 
            FROM 
                language 
            WHERE 
                name = 'English'    
        )
    )
    ) AND
    (film.rating IN *'G', 'R', 'NC-17')
ORDER BY
    film.language_id
DESC
LIMIT 40;



SELECT 
    'Introduction To Sub Query with variable'
AS 
    'INFO';


SET @FRENCH_ID=(SELECT 
    language_id 
FROM 
    language 
WHERE 
    name = 'French');


SET @ENGLISH_ID=(SELECT 
    language_id 
FROM 
    language 
WHERE 
    name = 'English');


SET @ITALIAN_ID=(SELECT 
    language_id 
FROM 
    language 
WHERE 
    name = 'Italian');



SELECT 
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.release_year
FROM
    film
WHERE
    (film.release_year BETWEEN 2000 AND 2010) AND
    (film.length BETWEEN 70 AND 80) AND
    (film.language_id IN (@FRENCH_ID, @ENGLISH_ID, @ITALIAN_ID)) AND
    (film.rating IN ('G','R','NC-17'))
ORDER BY 
    film.language_id 
DESC
LIMIT 40;