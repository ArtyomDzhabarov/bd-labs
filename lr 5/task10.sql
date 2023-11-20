/*Этот запрос вычисляет общее количество слотов бронирования для каждого объекта в каждом месяце 2012 года, а также добавляет общий подсчет по всем месяцам с помощью ключевого слова WITH ROLLUP*/
USE cd;
SELECT
    facid,
    MONTH(starttime) AS month,
    COALESCE(SUM(slots), 0) AS total_slots
FROM
    bookings
WHERE
    YEAR(starttime) = 2012
GROUP BY
    facid, month
WITH ROLLUP
ORDER BY
    facid, month;
