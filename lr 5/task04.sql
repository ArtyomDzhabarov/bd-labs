/*Мы соединяем таблицы "facilities" и "bookings", подсчитывая количество слотов бронирования для каждого объекта, используя функцию COUNT*/
USE cd;
SELECT fac.facid as Facid,
fac.facility as Facility,
COUNT (boo.slots) AS rec
FROM facilities fac
JOIN bookings boo ON boo.facid = fac.facid
GROUP BY fac.facid, fac.facility;