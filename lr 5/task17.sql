/*Этот запрос вычисляет количество уникальных бронирований (bookingscount) для каждого члена в зависимости от уровня дохода объекта бронирования. Для этого мы используем условные выражения для определения уровня дохода (incomegroup) и соединяем таблицы "members", "bookings" и "facilities". Затем результаты группируются по memid, incomegroup и facilityname*/
USE cd;
SELECT DISTINCT
    COUNT(b.bookid) AS bookings_count,
    CASE
        WHEN f.membercost + f.guestcost >= 30 THEN 'Высокие доходы'
        WHEN f.membercost + f.guestcost >= 20 THEN 'Средние доходы'
        ELSE 'Низкие доходы'
    END AS income_group,
    f.facility AS facility_name
FROM
    members m 
LEFT JOIN
    bookings b ON m.memid = b.memid
LEFT JOIN
    facilities f ON b.facid = f.facid
GROUP BY
    m.memid, income_group, facility_name
ORDER BY
    income_group, facility_name;