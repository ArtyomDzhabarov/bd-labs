USE cd;
START TRANSACTION; /*Начинает транзакцию*/
DELETE FROM bookings; /*Удаляет все данные из таблицы "bookings"*/
SELECT * FROM bookings; /*Выполняет запрос на выбор всех данных из таблицы "bookings"*/
ROLLBACK; /*Отменяет транзакцию*/
SELECT * FROM bookings; /*Выполняет запрос на выбор всех данных из таблицы "bookings"*/