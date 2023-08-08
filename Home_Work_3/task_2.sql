/*Выведите 5 максимальных заработных плат (saraly)*/

SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;