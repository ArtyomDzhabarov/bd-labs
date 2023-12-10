USE cd;
SELECT m.memid AS ID, CONCAT(m.firstname, ' ', m.surname) AS fiomember, MIN(b.starttime)
/* Выбирает memid из таблицы members, а также объединяет firstname и surname в одно поле под названием fiomember,
и находит MIN(starttime) из таблицы bookings.*/
FROM members m 
LEFT JOIN bookings b ON m.memid = b.memid WHERE b.starttime >= '2012-09-01' AND m.firstname != 'Guest'
/*LEFT JOIN для соединения таблиц members и bookings по memid
starttime должна быть больше или равна '2012-09-01', и фильтрует результаты по имени, исключая 'Guest'.*/
GROUP BY m.memid, m.firstname, m.surname ORDER BY m.memid; /*Группирует результаты по memid, firstname и surname и сортирует их по memid.*/