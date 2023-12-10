USE cd;
START TRANSACTION; /*Начинает транзакцию*/
DELETE FROM members WHERE memid = 37; /*Удаляет данные из таблицы "members", где memid=37*/
SELECT * FROM members; /*Выполняет запрос на выбор всех данных из таблицы "members"*/
COMMIT; /*Фиксирует изменения*/
SELECT * FROM members; /*Выполняет запрос на выбор всех данных из таблицы "members"*/