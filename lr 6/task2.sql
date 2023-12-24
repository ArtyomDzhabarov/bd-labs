USE cd;
SELECT YEAR(b.starttime)AS YEAR,MONTH(b.starttime) AS month, COUNT(*) AS rental_count
from bookings b 
JOIN facilities f ON b.facid = f.facid
GROUP BY month(b.starttime), year(b.starttime);
/* год и месяц из столбца "starttime" таблицы "bookings" и подсчитывает количество записей. 
Затем происходит объединение с таблицей "facilities" по идентификатору объекта. 
Результат группируется по месяцу и году.*/