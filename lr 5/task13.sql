USE cd;
SELECT ROW_NUMBER() OVER (ORDER BY joindate) AS 'Номер', memid AS ID, 
/*Использует функцию ROW_NUMBER() OVER (ORDER BY joindate) для нумерации строк 
в результирующем наборе данных в порядке возрастания даты присоединения (joindate).*/
CONCAT(firstname,' ', surname) AS fiomember, joindate 
/*Выбирает memid (ID), объединяет firstname и surname в одну строку, называемую fiomember, и также выводит дату присоединения.*/
FROM members ORDER BY joindate;  /*Сортирует результаты по дате присоединения (joindate).*/