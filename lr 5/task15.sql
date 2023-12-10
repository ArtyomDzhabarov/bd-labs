USE cd;
SELECT CONCAT(m.firstname, ' ', m.surname) AS fiomember, ROUND(SUM(COALESCE(b.slots / 2, 0)), -1) as 'Часы', 
/*Выбирает объединенные firstname и surname, округленную сумму слотов (полчасовые интервалы) с помощью функции ROUND*/
RANK() OVER (ORDER BY ROUND(SUM(COALESCE(b.slots / 2, 0)), -1)) AS ranks
/*выставляет результаты по этой округленной сумме.*/
FROM members m
LEFT JOIN bookings b ON m.memid = b.memid GROUP BY m.memid ORDER BY m.surname, m.firstname;
/*Присоединяет таблицы members и bookings по memid.*/
/*Группирует результаты по memid.*/
/*Сортирует результаты по surname (фамилии) и firstname (имени).*/