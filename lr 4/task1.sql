USE cd;
INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES (9, 'spa', 20, 30, 100000, 800); /*вставки новой строки в таблицу "facilities"*/
SELECT * FROM facilities;  /*извлечения всех данных из таблицы "facilities"*/