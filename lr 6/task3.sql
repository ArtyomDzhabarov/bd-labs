USE cd;
/*общий табличный выражение (Common Table Expression, CTE). 
Он вычисляет сначала агрегированные значения и форматирует дату для дальнейшего использования в основном запросе*/
WITH slots as(
    SELECT  facility, SUM(b.slots) AS rent_count,
    DATE_FORMAT(b.starttime, '%m %Y') AS year__
    FROM facilities f 
    JOIN bookings b ON b.facid = f.facid
    GROUP BY f.facid, year__
)
/*выборка из таблицы "facilities" и "bookings", где считается сумма слотов для каждого объекта в каждом месяце. 
Результат группируется по идентификатору объекта и месяцу.*/
SELECT s1.facility, CONCAT(ROUND(s1.rent_count / SUM(s2.rent_count)* 100, 1), '%') AS usability, s1.year__
/*ранее созданное CTE. Он выбирает название объекта, процент использования объекта в определенный месяц 
и сам месяц. Процент рассчитывается путем деления суммы слотов для конкретного объекта в определенном месяце на общее количество слотов 
за этот месяц и умножения на 100. Результат упорядочивается по проценту использования по возрастанию.*/
FROM slots s1 
JOIN slots s2 ON s1.year__ = s2.year__ /* объединение таблицы с самой собой для сравнения использования объектов в разные месяцы.*/
GROUP BY s1.facility, s1.rent_count, s1.year__ /*Группировка результатов по названию объекта, количеству занятых слотов и месяцу.*/
ORDER BY CAST(usability as FLOAT) ASC; /*упорядочивание результатов по проценту использования в порядке возрастания, для чего производится явное преобразование процентов в числовой формат и их последующая сортировка.*/
