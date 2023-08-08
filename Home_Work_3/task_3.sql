/*Посчитайте суммарную зарплату (salary) по каж дой специальности (роst)*/

SELECT post,
SUM(salary) as sum_salary 
FROM staff
GROUP BY post;
