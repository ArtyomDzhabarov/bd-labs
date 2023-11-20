/*В этом запросе мы выбираем дату начала бронирования (starttime) в качестве date и вычисляем скользящее среднее (rollingavgincome) для суммы membercost и guestcost каждого бронирования. Мы объединяем таблицы "bookings" и "facilities", фильтруя записи по заданному временному промежутку (с 1 по 31 августа 2012 года). Затем результаты группируются по дате и упорядочиваются по дате начала бронирования*/
USE cd;
SELECT
    DATE(b.starttime) AS date,
    AVG(f.membercost + f.guestcost) AS rolling_avg_income
FROM
    bookings b
JOIN
    facilities f ON b.facid = f.facid
WHERE
    DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31'
GROUP BY
    DATE(b.starttime)
ORDER BY
    DATE(b.starttime);