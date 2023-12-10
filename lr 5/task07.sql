USE cd;
/*вычисляет количество уникальных memid в таблице "bookings". Применяем функцию COUNT для подсчета уникальных значений*/
SELECT COUNT(DISTINCT memid) FROM bookings;
