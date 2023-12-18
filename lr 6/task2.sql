USE cd;
/*Task-6-2. Выберите количество аренд объектов клуба в каждый месяц.*/
SELECT YEAR(b.starttime), MONTH(b.starttime), 
       f.facility, COUNT(*)
/* В данном запросе происходит выборка по следующим критериям:
- YEAR(b.starttime) - Извлечение года из поля starttime (дата начала бронирования).
- MONTH(b.starttime) - Извлечение месяца из поля starttime (дата начала бронирования).
- f.facility - Название объекта (оборудования или помещения).
- COUNT(*) - Подсчет общего количества бронирований для каждого объекта в каждом месяце.*/
  FROM bookings b, facilities f 
  WHERE b.facid = f.facid /*объединения таблиц bookings и facilities по facid*/
  GROUP BY YEAR(starttime), MONTH(starttime), facility;
  /*используется для группировки результатов по году, месяцу и объекту позволяя подсчитать количество бронирований для каждого объекта клуба в каждом месяце.*/
  

