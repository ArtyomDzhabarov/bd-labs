USE cd;
SELECT starttime
FROM bookings
JOIN members ON bookings.memid = members.memid
WHERE members.firstname = 'David' AND members.surname = 'Farrell';
/*Данный SQL-запрос выбирает время начала брони всех бронирований участников
с именем 'David' и фамилией 'Farrell'из таблицы "bookings",
объединенной с таблицей "members" по полю memid.*/