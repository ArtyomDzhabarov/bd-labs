USE cd;
SELECT firstname AS 'объединение', 'член клуба' AS 'расположение' FROM members
UNION
SELECT facility AS 'объединение', 'объект' AS 'расположение' FROM facilities;
/*Создаём "расположение" и "обьединение", "firstname" и "facility" добавляем в "обьединение" и в "расположение" делим на членов клуба и объекты*/