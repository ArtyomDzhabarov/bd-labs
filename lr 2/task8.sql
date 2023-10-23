/*объекты с дешевой качественной стоимостью*/
USE cd;
SELECT facility, 'дешёвый' AS 'качественная стоимость'  FROM facilities WHERE monthlymaintenance <100
/*объекты с дорогой качественной стоимостью*/
UNION
SELECT facility, 'дорогой' AS 'качественная стоимость' FROM facilities WHERE monthlymaintenance >=100;
/*если товар <100 то он добавляется в "качественная стоимость" как дешёвый, а если >=100? то как дорогой */