USE cd; /* Эта строка указывает, что мы хотим использовать базу данных с именем "cd"*/
SELECT CONCAT(mem.firstname, ' ', mem.surname) AS membername, /*В этой части запроса используется оператор SELECT для выбора данных из базы данных. Мы используем функцию CONCAT для объединения имени и фамилии члена клуба в одну строку, а затем используем ключевое слово AS для создания псевдонима "membername" для этой новой сформированной строки*/
(SELECT CONCAT(rec.firstname, ' ', rec.surname) FROM members rec WHERE mem.recommendedby = rec.memid) AS recname /* Эта часть кода представляет подзапрос, который ищет имена и фамилии людей, которые рекомендовали членов клуба. Он использует подзапрос для объединения имени и фамилии, относящихся к члену клуба, с теми, кто его рекомендовал, и создает псевдоним "recname" для этой информации*/
FROM members mem /*Эта строка указывает, что мы выбираем данные из таблицы с именем "members" и создаем псевдоним "mem" для этой таблицы, чтобы обращаться к ней так в запросе*/
WHERE mem.memid != 0 /*Здесь мы сортируем результаты, чтобы нам попали только те строки, у которых значение поля "memid" не равно 0*/
ORDER BY mem.firstname; /*строка запроса, которая указывает, что результаты должны быть упорядочены по значению поля "firstname" в таблице "members" в порядке возрастания*/
