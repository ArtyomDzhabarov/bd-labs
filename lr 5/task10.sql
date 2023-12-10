USE cd;
SELECT 	IFNULL(derived_table.facid, 'Total') as facid, /*используется функция IFNULL для замены значений NULL на 'Total' в столбце facid. Это означает, что если значение facid равно NULL, оно будет заменено на 'Total'.*/
		IFNULL(derived_table.month, 'Total') as month, /*Аналогично, функция IFNULL здесь используется для замены NULL значений в столбце month на 'Total'.*/
        SUM(derived_table.slots) AS 'Количество мест' /*вычисляем сумму слотов для каждой комбинации facid и month и переименовываем этот столбец в 'Количество мест'.*/
FROM 
(SELECT 
        f.facid AS facid,
        MONTH(b.starttime) AS month,
        SUM(b.slots) as slots /*вычисляем сумму слотов (slots) для каждой комбинации объекта (facid) и месяца*/
    FROM
        facilities f
    INNER JOIN bookings b ON f.facid = b.facid /*JOIN, который объединяет таблицы "facilities" и "bookings" по facid */
    WHERE
        YEAR(b.starttime) = 2012 /*фильтрации данных после объединения таблиц. Здесь мы выбираем только бронирования, сделанные в 2012 году*/
    GROUP BY facid, month, slots) AS derived_table /* группируем результаты по facid, month и slots.*/
GROUP BY facid, month WITH ROLLUP; /*ROLLUP используется для создания итоговых строк. Оно позволяет нам получить общее количество для каждого facid и month, а также общее количество для всех значений facid и month.*/
