USE cd;
SELECT facilities.facid as Facid,
facilities.facility as Facility,
SUM(bookings.slots) AS rec
/*выбираем поля facid и facility из таблицы "facilities" и суммируем значения поля slots из таблицы "bookings"
для каждого объекта. Результат суммирования переименовываем в rec.*/
FROM facilities /*выбирает данные из таблицы "facilities".*/
JOIN bookings ON bookings.facid = facilities.facid /*объединяем таблицы "facilities" и "bookings" по общему facid*/
WHERE DATE(bookings.starttime) >= '2012-09-01' AND DATE(bookings.starttime) <= '2012-09-30'
/* Применяется фильтр по дате, чтобы выбрать только бронирования, сделанные в сентябре 2012 года.*/
GROUP BY facilities.facid, facilities.facility;
/*Этот запрос группирует результаты по facid и facility из таблицы "facilities".*/