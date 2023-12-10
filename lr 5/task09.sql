USE cd;
SELECT facility AS object_name, /*Здесь мы выбираем название объекта (facility).*/
SUM(CASE
WHEN bookings.memid = 0 THEN facilities.guestcost 
ELSE facilities.membercost
END) AS total_revenue
/*Мы используем условное выражение (CASE WHEN), которое проверяет значение memid из таблицы bookings.
 Если memid равен 0, используется guestcost из таблицы facilities, в противном случае - membercost
 Затем результаты суммируются для каждого объекта и переименовываются в total_revenue.*/
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid /*Мы объединяем таблицы "facilities" и "bookings" по facid*/
GROUP BY facility /*Результаты группируются по названию объекта.*/
HAVING total_revenue < 1000 /*Фильтрация результатов. Здесь выбираются только те объекты, где выручка меньше 1000.*/
ORDER BY total_revenue;USE cd; /* Результаты упорядочиваются по общей выручке.*/
SELECT
    DATE(b.starttime) AS date, /*мы выбираем дату (преобразуя starttime из таблицы bookings в тип date)*/
    AVG(f.membercost + f.guestcost) AS rolling_avg_income 
FROM
    bookings b /*вычисляем средний доход (rolling_avg_income) на основе стоимости бронирования из таблицы facilities.*/
JOIN
    facilities f ON b.facid = f.facid /*Мы объединяем таблицы "bookings" и "facilities" на основе facid.*/
WHERE
    DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31' /*фильтруем,чтобы выбрать бронирования, сделанные в августе 2012 года.*/
GROUP BY
    DATE(b.starttime) /*Результаты группируются по дате.*/
ORDER BY
    DATE(b.starttime); /*Результаты упорядочиваются по дате.*/
