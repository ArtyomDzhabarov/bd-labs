/*Мы объединяем таблицы "members" и "bookings", вычисляя общее количество часов бронирования для каждого участника или гостя, а затем сортируем результаты по статусу, количеству часов и фамилии участника*/
USE cd;
SELECT
    CONCAT(m.firstname, ' ', m.surname) AS member_name,
    ROUND(SUM(TIMESTAMPDIFF(HOUR, b.starttime, TIMESTAMPADD(HOUR, 1, b.starttime))), -1) AS rounded_hours,
    CASE
        WHEN mb.memid IS NOT NULL THEN 'Участник'
        ELSE 'Гость'
    END AS status
FROM
    bookings b
LEFT JOIN
    members m ON b.memid = m.memid
LEFT JOIN
    members mb ON b.memid = mb.memid AND mb.memid <> 0
GROUP BY
    b.memid
ORDER BY
    status, rounded_hours DESC, m.surname, m.firstname;