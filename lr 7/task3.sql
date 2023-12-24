USE cd;
/*Task-7-3. Создаем процедуру для расчета окупаемости объектов на основе оплаты за месяц*/
DELIMITER //
CREATE PROCEDURE CalculateProfitability(IN monthYear DATE) /*создает новую хранимую процедуру с именем CalculateProfitability, которая принимает один параметр monthYear типа DATE.*/
BEGIN
    DECLARE totalCost DECIMAL(10, 2); /*объявляется локальная переменная totalCost типа DECIMAL(10, 2), которая будет использоваться для хранения общего расхода.*/
    DECLARE totalIncome DECIMAL(10, 2); /*объявляет локальную переменную totalIncome типа DECIMAL(10, 2), которая будет хранить общий доход.*/

    SELECT SUM(initialoutlay + (monthlymaintenance * DATEDIFF(month(now()), monthYear)))
    INTO totalCost
    FROM facilities;
    /*запросе SELECT вычисляется общая сумма расходов. 
    Он извлекает данные из таблицы facilities, где initialoutlay представляет собой начальные затраты, 
    monthlymaintenance - ежемесячные траты, а DATEDIFF(month(now()), monthYear) вычисляет разницу в месяцах между текущей датой и monthYear. 
    Значение этого выражения суммируется для каждой записи в facilities и сохраняется в переменной totalCost.*/

    SELECT SUM(payment)
    INTO totalIncome
    FROM payments
    JOIN bookings ON payments.bookid = bookings.bookid
    WHERE MONTH(bookings.starttime) = MONTH(monthYear)
      AND YEAR(bookings.starttime) = YEAR(monthYear);

    /*вычисляется общая сумма доходов. 
    Он извлекает сумму платежей из таблицы payments, связывая данные с таблицей bookings по bookid. 
    Затем выполняется фильтрация записей, чтобы вернуть только те, которые соответствуют указанному месяцу и году в переменной monthYear. 
    Результат сохраняется в переменной totalIncome.*/

    SELECT totalIncome - totalCost AS Profitability; /* вычисление разницы между общим доходом и общими расходами, и результат сохраняется как Profitability*/
END;
//
DELIMITER ;
