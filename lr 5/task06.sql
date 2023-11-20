/*Здесь мы вычисляем общее количество бронирований для каждого объекта (facid) в каждом месяце 2012 года*/
USE cd;
SELECT EXTRACT(MONTH FROM starttime) AS MONTH, bookings.facid , COUNT(*) AS TOTAL_BOOKINGS FROM bookings
WHERE EXTRACT(YEAR FROM starttime) = 2012
GROUP BY MONTH, facid;