USE cd;
UPDATE facilities
SET membercost = membercost * 1.1, guestcost = guestcost * 1.1
WHERE facid = 0;
/*UPDATE используется для изменения данных в таблице "facilities". 
В данном случае, он умножает значения полей "membercost" и "guestcost" на 1.1 для строки, где значение поля "facid" равно 0.*/
SELECT * FROM facilities;