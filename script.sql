-- 4.1) Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

--Insert
INSERT INTO actor (actor_id, first_name, last_name) 
VALUES (?, ?, ?);

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, picture)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, active)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--Update
UPDATE customer
SET store_id = ?, first_name = ?, last_name = ?, email = ?, address_id = ?, activebool = ?, active = ?
WHERE <condition>;

UPDATE staff
SET first_name = ?, last_name = ?, address_id = ?, email = ?, store_id = ?, active = ?, username = ?, password = ?, picture = ?
WHERE <condition>;

UPDATE actor
SET first_name = ?, last_name = ?
WHERE <condition>;

--Delete
DELETE FROM actor
WHERE <condition>;

DELETE FROM staff
WHERE <condition>;

DELETE FROM customer
WHERE <condition>;

-- 4.2) Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT r.rental_id, r.rental_date, c.customer_id, c.first_name, c.last_name
FROM rental r
JOIN customer c on c.customer_id = r.customer_id
WHERE EXTRACT(YEAR FROM rental_date) = 2005 AND EXTRACT(MONTH FROM rental_date) = 5;

-- 4.3) Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
-- SELECT count(payment_id) as numero, DATE(payment_date) as fecha, sum(amount) as total
-- FROM payment
-- GROUP BY fecha
-- ORDER BY fecha;

SELECT payment_id AS Número,
       payment_date AS Fecha, 
       amount AS Total
FROM Payment
GROUP BY payment_id, payment_date;

-- 4.4) Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT f.film_id, f.title, l.name as language, release_year, rental_rate
FROM film f
JOIN language l on l.language_id = f.language_id
WHERE release_year=2006 AND rental_rate>4
ORDER BY f.film_id;

-- 5) Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT table_name, column_name, is_nullable, data_type
FROM information_schema.columns
WHERE table_schema = 'public';