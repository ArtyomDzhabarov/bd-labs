use cd;
INSERT INTO facilities(facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
/*INSERT используется для вставки новых строк в таблицу "facilities". Он указывает столбцы, в которые будут вставлены значения (facid...*/
  SELECT MAX(facid) + 1,'Squash Court 2', 3.5, 17.5,  5000,  80
    FROM facilities
/*создания новой строки данных. Он выбирает максимальное значение поля "FACID" из таблицы "facilities", добавляет к нему 1, затем вставляет новое значение "Squash Court 2"*/
  UNION /*объединения результатов двух операторов SELECT в один набор результатов.*/
  SELECT MAX(facid) + 2,'Squash Court 3', 3.5, 17.5,  5000,  80
    FROM facilities;
/*аналогичен предыдущему, но добавляет новую строку для "Squash Court 3"*/
COMMIT; /*COMMIT фиксирует результаты этих операций.*/
SELECT * FROM facilities;