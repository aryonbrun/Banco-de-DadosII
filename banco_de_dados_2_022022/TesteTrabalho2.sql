USE sakila;

SET
    @ID_CARACAS = (
        SELECT
            city_id
        FROM
            city
        WHERE
            city = "Caracas"
    );

SET
    @ID_ADDRESS = (
        SELECT
            address_id
        FROM
            address
        WHERE
            city_id = @ID_CARACAS
    );

/*-------------------------------------------------------------------------------*/

SELECT
    "SELECT CUSTOMER_ID FROM CUSTOMERS LIVING IN CARACAS" AS MESSAGE_LOG;

SELECT
    customer.customer_id
FROM
    customer
WHERE
    address_id IN(@ID_ADDRESS);

/*-------------------------------------------------------------------------------*/

SELECT
    "SELECT FILMS WATCHED BY CARACAS CUSTOMERS" AS MESSAGE_LOG;

SELECT
    film.title AS Title,
    film.description AS Description
FROM
    film
WHERE
    film_id IN(
        SELECT
            inventory.film_id
        FROM
            inventory
        WHERE
            inventory_id IN(
                SELECT
                    rental.inventory_id
                FROM
                    rental
                WHERE
                    customer_ID IN(
                        SELECT
                            customer.customer_id
                        FROM
                            customer
                        WHERE
                            address_id IN(@ID_ADDRESS)
                    )
            )
    );