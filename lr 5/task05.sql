/*Этот запрос считает количество бронирований для каждого объекта из таблицы "bookings" во временном промежутке с 2012-08-01 по 2012-09-30*/
USE cd;
SELECT facid, COUNT(*) FROM bookings WHERE starttime > '2012-08-31' AND starttime <='2012-09-30'  GROUP BY facid;