USE cd;
DELIMITER //
CREATE FUNCTION CalculateRentChangePercentag(
    facID INT, 
    percentageChange DECIMAL(5, 2),
    current_day DATE
) RETURNS DECIMAL(5, 2) DETERMINISTIC
/*ператор создает новую пользовательскую функцию с именем CalculateRentChangePercentag, принимающую три входных параметра: 
facID (целочисленный идентификатор объекта), 
percentageChange (процентное изменение), 
current_day (текущая дата). 
Функция возвращает значение DECIMAL(5, 2) и помечается как DETERMINISTIC, что означает, 
что результат функции зависит только от переданных аргументов, и для одинаковых наборов входных параметров всегда будет возвращаться одинаковый результат.*/
BEGIN
    DECLARE avgCostPerHour DECIMAL(10, 2);
    DECLARE maintenanceCost DECIMAL(10, 2) DEFAULT 0;
    DECLARE totalCost DECIMAL(10, 2);
    /*Определяется несколько локальных переменных, таких как avgCostPerHour, maintenanceCost и totalCost, 
    которые будут использоваться для временного хранения промежуточных результатов.*/

    /*Рассчитываем среднюю стоимость аренды*/
    SELECT AVG(slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) / COUNT(*) 
    /*вычисляем среднюю стоимость аренды на основе количества слотов и стоимости для гостей или участников клуба. 
    CASE WHEN используется для проверки, является ли memid NULL (что означает, что бронирование сделано гостем), 
    и в зависимости от этого выбирается соответствующая стоимость (guestcost или membercost). 
    После чего производится умножение на количество слотов.
    результат умножения делится на общее количество записей, что позволяет нам рассчитать среднюю стоимость аренды на час.*/
    INTO avgCostPerHour
    FROM bookings
    WHERE facid = facID AND paid AND starttime >= current_day;
    /*данные для расчета средней стоимости аренды берутся из таблицы bookings, 
    при этом выполняется фильтрация по следующим условиям:
   -facid = facID: Идентификатор объекта, для которого происходит аренда, соответствует переданному в функцию facID.
   -paid: Требуется, чтобы бронирование было оплачено.
   -starttime >= current_day: Дата начала бронирования позже или равна текущей дате.*/


    /*Рассчитываем суммарные расходы на обслуживание (если такая таблица существует)*/
    IF EXISTS (SELECT 1 FROM information_schema.tables 
               WHERE table_schema = 'your_database_name' 
               AND table_name = 'maintenance') THEN
    /* условие IF EXISTS для проверки существования таблицы с именем 'maintenance' в базе данных. 
    Оператор SELECT 1 FROM information_schema.tables... проверяет наличие таблицы 'maintenance' в информационной схеме базы данных. 
    Если такая таблица существует, условие будет истинным, и выполнится блок кода внутри IF.*/
        SELECT SUM(cost)
        INTO maintenanceCost
        FROM maintenance
        WHERE facid = facID AND date >= current_day;
    /* Если таблица 'maintenance' существует, то происходит запрос SELECT для рассчета суммарных расходов на обслуживание. 
    Оператор SUM(cost) вычисляет общую сумму из столбца 'cost' в таблице 'maintenance', удовлетворяющей условиям 
    -facid = facID (идентификатор объекта)
    -date >= current_day (дата обслуживания позже или равна текущей дате)
    Результат этого запроса сохраняется в переменную maintenanceCost для дальнейшего использования.*/
    END IF; /*завершает блок кода, который выполняется при условии, что таблица 'maintenance' существует.*/

    /*Рассчитываем общую стоимость с учетом обслуживания*/
    SET totalCost = avgCostPerHour + maintenanceCost; /*вычисление общей стоимости с учетом обслуживания путем сложения значение avgCostPerHour (средняя стоимость аренды на час) и значение maintenanceCost (суммарные расходы на обслуживание).*/

    /*Возвращаем изменение стоимости с учетом процента изменения*/
    RETURN totalCost * (percentageChange / 100); /*Расчет происходит путем умножения общей стоимости (totalCost) на процентное изменение (percentageChange), деленное на 100. Результат этого выражения возвращается в качестве значения функции.*/
END;
//
DELIMITER ;
