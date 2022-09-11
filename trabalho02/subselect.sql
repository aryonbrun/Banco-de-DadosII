--TRABALHO02

-- USANDO SUBSELECT, DENTRO DO BASE DE DADOS DO SAKILLA

-- Responda (mostrando a evidência em um .sql)
-- a seguinte pergunta: 
-- Quais foram os filmes assistidos pelos moradores de Caracas?

USE sakila;

SELECT film.film_id, film.title 
FROM film
WHERE film_id IN( 

    SELECT inventory.film_id 
    FROM inventory
    WHERE inventory_id IN(
        
        SELECT rental.inventory_id 
        FROM rental
        WHERE customer_id IN(

            SELECT customer.customer_id
            FROM customer
            WHERE customer.address_id IN(

                SELECT address.address_id
                FROM address
                WHERE address.city_id IN(
                    
                    SELECT city.city_id
                    FROM city
                    WHERE city.city = 'Caracas'
                )
            )
        )
    )
)




