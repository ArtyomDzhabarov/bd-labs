USE cd;
SELECT DISTINCT CONCAT(f.facility, ' ', m.firstname) AS FacilityandName, 
CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots
ELSE f.membercost * b.slots 
END AS cost
FROM bookings b
JOIN facilities f ON b.facid = f.facid
JOIN members m ON b.memid = m.memid
WHERE DATE(b.starttime) = '2012-09-14' AND ((b.memid = 0 AND  f.guestcost * b.slots > 30) OR (b.memid != 0 AND f.membercost * b.slots > 30)) 
ORDER BY cost DESC;
/*Данный запрос выбирает уникальные сочетания названия объекта и имени участника,
а также вычисляет стоимость бронирования. Он использует CASE выражение для определения стоимости в зависимости
от того, является ли участник членом или гостем, и затем выбирает те бронирования, где стоимость превышает 30, 
сортируя их по убыванию стоимости.*/
