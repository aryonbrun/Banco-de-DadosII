-- Quais foram os filmes,
-- assistidos pelos moradAores de Caracas?

-- INNER JOIN Retorna linhas quando houver pelo menos uma correspondia
-- em ambas tabelas

USE sakila;

SELECT
 
    film.title
 
FROM
    film

INNER JOIN inventory
    ON inventory.film_id = film.film_id
INNER JOIN rental
    ON rental.inventory_id = inventory.inventory_id
INNER JOIN customer
    ON customer.customer_id = rental.customer_id
INNER JOIN address
    ON address.address_id = customer.address_id
INNER JOIN city
    ON city.city_id = address.city_id

        WHERE city.city = "Caracas";
