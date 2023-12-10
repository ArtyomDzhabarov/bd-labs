USE cd;
SELECT f.facility, MONTH(b.starttime) AS 'Месяц', SUM(b.slots) AS 'Количество бронирований' FROM facilities f
/*Мы выбираем название объекта (facility) и месяц начала бронирования. Затем мы суммируем количество слотов для каждого объекта.*/
INNER JOIN bookings b ON f.facid = b.facid WHERE YEAR(b.starttime) = 2012
/*внутреннее объединение таблиц "facilities" и "bookings" за счёт общего facid.*/
/*В "WHERE..." выбираются только бронирования, сделанные в 2012 году.*/
GROUP BY f.facility, MONTH(b.starttime);
/* Результат группируется по названию объекта и месяцу начала бронирования.*/
