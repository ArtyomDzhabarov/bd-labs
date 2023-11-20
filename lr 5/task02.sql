/*Здесь мы считаем количество строк в таблице "facilities", у которых значение столбца "guestcost" больше 10*/
USE cd;
SELECT COUNT(*) FROM facilities WHERE guestcost > 10;