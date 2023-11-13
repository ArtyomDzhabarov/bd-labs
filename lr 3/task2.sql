USE cd;
SELECT facility FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
WHERE facilities.facility LIKE '%Tennis court%' AND bookings.starttime >= ('2012-09-19 00:00:01') AND bookings.starttime < ('2012-09-20 00:00:01');
/*Этот запрос выбирает названия всех удовлетворяющих условиям строк из таблицы "facilities",
объединенной с таблицей "bookings" по полю facid. Условия выбора включают проверку наличия Tennis court
в названии, а также времени начала брони после '2012-09-19 00:00:01' и до '2012-09-20 00:00:01'.*/
