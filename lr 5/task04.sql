USE cd;
SELECT facilities.facid as Facid, /*Начинается выборка данных. Мы выбираем столбец facid из таблицы "facilities" и переименовываем его в Facid,*/
facilities.facility as Facility, /*затем выбираем столбец facility из той же таблицы.*/
SUM(bookings.slots) AS rec /* подсчитываем суммы значений столбца slots из таблицы "bookings" для каждого объекта. Результат будет переименован в rec.*/
FROM facilities /*выбирает данные из таблицы "facilities".*/
JOIN bookings ON bookings.facid = facilities.facid /*объединение таблиц "facilities" и "bookings" через общий facid*/
GROUP BY facilities.facid, facilities.facility; /*Этот запрос группирует результаты по facid и facility из таблицы "facilities".*/
