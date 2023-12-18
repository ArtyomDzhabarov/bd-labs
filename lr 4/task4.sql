USE cd;
UPDATE facilities
SET initialoutlay = 10000
WHERE facid = 1;
/*UPDATE используется для изменения данных в таблице "facilities". В данном случае, 
он обновляет значение поля "initialoutlay" на 10000 для строки, где значение поля "facid" равно 1.*/
SELECT * FROM facilities;