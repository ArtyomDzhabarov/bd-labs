USE cd;
SELECT DISTINCT firstname, surname FROM members
JOIN bookings ON members.memid = bookings.memid
JOIN facilities ON facilities.facid = bookings.facid
WHERE facilities.facility LIKE 'Tennis court 1' OR facilities.facility LIKE 'Tennis court 2';
/*Этот запрос выбирает уникальные имена и фамилии участников, которые забронировали Tennis court 1 или Tennis court 2
из таблиц "members", "bookings" и "facilities", объединенных между собой по соответствующим полям.*/
