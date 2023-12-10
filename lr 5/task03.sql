USE cd;
SELECT mem.memid AS MemberID,
mem.firstname AS firstname,
mem.surname AS lastname,
/*Мы выбираем столбец memid и переименовываем его в MemberID.
Затем мы выбираем столбцы firstname и surname из таблицы "members".*/
COUNT (mem2.memid) AS rec_count
/*Здесь используется функция COUNT для подсчета количества memid из таблицы "members"*/
/*которые связаны с memid из исходной таблицы "members" через поле recommendedby.
Результат этой операции мы переименовываем в rec_count.*/
FROM members mem /*мы берем данные из таблицы "members" и обозначаем ее как "mem".*/
JOIN members mem2 ON mem.memid = mem2.recommendedby /*Здесь мы выполняем операцию объединения таблицы "members" саму с собой*/
/*memid из первой таблицы "members"(mem) равен recommendedby из второй таблицы "members"(mem2).*/
GROUP BY mem.memid, mem.firstname, mem.surname; /* группирует результаты по memid, firstname и surname из таблицы "members".*/