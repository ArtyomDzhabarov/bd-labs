USE cd;
SELECT DISTINCT facid, slots FROM (SELECT facid, slots, RANK() OVER (ORDER BY slots DESC) as maxrank FROM bookings) ranked_bookings
/*Выбирает уникальные значения facid и количество слотов (slots) из подзапроса*/
/*В подзапросе выбирает facid, slots и выставляет их по убыванию количества слотов с помощью функции RANK() OVER (ORDER BY slots DESC) с названием maxrank.*/
WHERE maxrank = 1; /*Фильтрует результаты, оставляя только те записи, у которых maxrank равен 1.*/
