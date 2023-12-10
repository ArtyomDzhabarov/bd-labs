USE cd;
SELECT b.facid, f.facility, ROUND(SUM(b.slots) / 2, 2) AS 'Часы' FROM bookings b
/*Выбирает facid из таблицы bookings и facility из таблицы facilities, а также вычисляет суммарное кол-во слотов(slots),
разделенное на 2 с округлением до 2 знаков после запятой, под именем 'Часы' (Hours).*/
LEFT JOIN facilities f ON b.facid = f.facid GROUP BY b.facid ORDER BY b.facid;
/*Использует LEFT JOIN для соединения таблиц bookings и facilities по полю facid.*/
/*Группирует результаты по facid.*/
/*Сортирует результаты по facid*/