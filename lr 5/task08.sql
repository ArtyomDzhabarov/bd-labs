USE cd;
SELECT facility AS object_name, /*Мы выбираем название объекта (facility).*/
SUM(CASE
WHEN bookings.memid = 0 THEN facilities.guestcost /*Здесь мы используем(CASE WHEN), которое проверяет значение memid из таблицы bookings*/
/*Если memid = 0, то используется guestcost из таблицы facilities*/
ELSE facilities.membercost /*в противном случае - membercost.*/
END) AS total_revenue /* Затем результаты суммируются для каждого объекта и переименовываются в total_revenue.*/
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid /*Мы объединяем таблицы "facilities" и "bookings" за счёт facid*/
GROUP BY facility /*Результаты группируются по названию объекта.*/
ORDER BY total_revenue DESC; /*Результаты упорядочиваются по общей выручке в порядке убывания.*/