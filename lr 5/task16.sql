USE cd;
/*Это начало конструкции с общей таблицей (Common Table Expression, CTE) с использованием ключевого слова WITH.
Она создает временную таблицу с именем RevenuePerFacility,которая будет использоваться в последующем основном запросе. */
WITH RevenuePerFacility AS (
SELECT f.facility AS FacilityName,
f.facid AS FacilityID,
COALESCE(SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END), 0) AS TotalRevenue
FROM facilities f
LEFT JOIN bookings b ON f.facid = b.facid
GROUP BY f.facid, f.facility
)
/*В этой части мы выбираем название объекта (FacilityName) и его идентификатор (FacilityID) из таблицы facilities.
 Мы также вычисляем общую выручку (TotalRevenue), которая суммирует количество бронированных слотов умноженных
 на стоимость соответствующего члена клуба (если memid = 0, то это гость, иначе это член).
 Функция COALESCE используется для замены любых значений NULL на 0.*/
SELECT FacilityName,
RANK() OVER (ORDER BY TotalRevenue DESC) AS Rank,
TotalRevenue
FROM RevenuePerFacility
ORDER BY Rank, FacilityName
LIMIT 3;
/*Эта часть основного запроса выбирает название объекта, его ранг на основе выручки (чем выше выручка, тем ниже ранг),
а также общую выручку. Результаты сортируются сначала по рангу (по убыванию) и названию объекта,
а затем используется ограничение, чтобы выбрать только три строки с наивысшей выручкой.*/
