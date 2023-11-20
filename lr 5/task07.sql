/*Этот запрос возвращает общее количество бронирований (записей) из таблицы "bookings"*/
USE cd;
SELECT COUNT(memid) FROM bookings;