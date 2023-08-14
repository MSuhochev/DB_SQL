-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT COUNT(*) AS likes_for_users_less_then_12yo
FROM profiles as p
INNER JOIN users AS u ON u.id = p.user_id
INNER JOIN media AS m ON m.user_id = u.id
INNER JOIN likes AS l ON l.media_id = m.id
WHERE YEAR(p.birthday) < 2011-08-14;

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT gender, COUNT(*) AS likes_count
FROM profiles AS p
INNER JOIN users AS u ON u.id = p.user_id
INNER JOIN likes AS l ON l.user_id = u.id
GROUP BY gender;

-- 3. Вывести всех пользователей, которые не отправляли сообщения.
SELECT DISTINCT u.id, u.firstname, u.lastname
FROM users AS u
LEFT JOIN messages AS m ON m.to_user_id = u.id
WHERE m.to_user_id IS NULL
