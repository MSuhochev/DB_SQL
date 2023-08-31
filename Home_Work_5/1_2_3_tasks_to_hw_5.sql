/* Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол)
, которые не старше 20 лет. */

CREATE VIEW user_information AS
WITH src AS (
SELECT 
	  u.firstname
    , u.lastname
    , p.hometown
    , p.gender
    , (YEAR(NOW()) - YEAR(birthday)) AS user_old
FROM users u
	INNER JOIN `profiles` p ON p.user_id = u.id
)
SELECT 
	  firstname
    , lastname
    , hometown
    , gender
FROM src
WHERE user_old < 20;

SELECT *
FROM user_information;

/* Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, 
указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге 
(первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK) */

;WITH src AS (
SELECT 
	  u.firstname
    , u.lastname
    , COUNT(*) AS count_user_messages
FROM users u
	INNER JOIN messages m ON m.from_user_id = u.id
GROUP BY u.firstname, u.lastname
)
SELECT 
	  firstname
    , lastname
    , count_user_messages
    , DENSE_RANK() OVER(ORDER BY count_user_messages DESC) AS drnk
FROM src;

/* Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at)
и найдите разницу дат отправления между соседними сообщениями,
получившегося списка. (используйте LEAD или LAG) */
;WITH src AS (
SELECT 
	  id
	, from_user_id
	, to_user_id
	, body
	, created_at
    , LAG(created_at) OVER(ORDER BY created_at ASC) AS lg
FROM messages
)
SELECT 
	*
    , DATEDIFF(created_at, lg) as 'difference_in_days'
FROM src
ORDER BY created_at;