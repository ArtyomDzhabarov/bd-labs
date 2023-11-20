/*Аналогично предыдущему запросу, но здесь мы также используем предикат HAVING для отображения только записей с общим доходом менее 1000*/
USE cd;
SELECT facility AS object_name,
SUM(CASE
WHEN bookings.memid = 0 THEN facilities.guestcost 
ELSE facilities.membercost
END) AS total_revenue
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
GROUP BY facility
HAVING total_revenue < 1000
ORDER BY total_revenue;