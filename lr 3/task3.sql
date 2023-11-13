USE cd;
SELECT DISTINCT m1.surname, m1.firstname
FROM members m1, members m2
WHERE m1.memid = m2.recommendedby;
/*Этот запрос выбирает уникальные пары имени и фамилии участника,
рекомендованных другими участниками. Он объединяет таблицу "members" с самой собой,
используя поле recommendedby для связи между рекомендуемым и рекомендующим участниками.*/
