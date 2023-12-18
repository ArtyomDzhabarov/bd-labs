USE cd;
UPDATE facilities
SET membercost = 6, guestcost = 30
WHERE facid IN (0, 1);
/*UPDATE используется для изменения данных в таблице "facilities". 
В данном случае, он обновляет значения полей "membercost" на 6 и "guestcost" на 30 для строк, где значение поля "facid" находится в списке (0, 1).*/
SELECT * FROM facilities;