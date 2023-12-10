USE cd;
SELECT * FROM members
WHERE memid NOT  IN (SELECT memid FROM bookings);
/*Выбирает всех участников из таблицы "members", у которых нет бронирований*/
DELETE FROM members
WHERE memid NOT IN (SELECT memid FROM bookings);
/*Удаляет всех участников из таблицы "members", у которых нет бронирований*/
SELECT * FROM members WHERE memid = 37; /*Выполняет запрос на выбор данных из таблицы "members", где memid=37*/
