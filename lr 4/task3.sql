use cd;
INSERT INTO facilities(facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance) /*вставки новых строк в таблицу "facilities*/
  SELECT (select max(facid)+1 from facilities) as new_fac_id,  /* выбираем максимальный FACID из таблицы facilities, добавляем 1 к этому значению и используем его в качестве нового идентификатора*/
         f.facility, f.membercost, f.guestcost, 
         f.initialoutlay, f.monthlymaintenance
    FROM facilities f 
    where f.facility = 'spa'
	  limit 1; /*мы выбираем характеристики (facility, ...) для существующего spa, чтобы вставить их в новую запись.*/
COMMIT; /*завершения текущей транзакции и сохранения изменений, внесенных в базу данных.*/