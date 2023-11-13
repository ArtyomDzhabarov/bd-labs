USE cd;
SELECT m1.surname, m1.firstname, m2.surname, m2.firstname
FROM members m1
LEFT JOIN members m2 ON m1.recommendedby = m2.memid
ORDER BY m1.surname, m1.firstname;
/*Этот запрос выбирает имена и фамилии участников и их рекомендующих, 
при этом участники, которых никто не рекомендовал, также будут отображены.
Он использует левое объединение (LEFT JOIN) таблицы "members" саму себя,
чтобы показать все участников, включая тех, кто не рекомендован, а также тех, кто рекомендован.*/
