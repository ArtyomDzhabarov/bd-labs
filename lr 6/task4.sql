USE cd;
/*Task-6-4.  Выведите список членов клуба, отформатированных как 'Surname, Firstname'*/
SELECT concat(upper(left(m.surname, 1)), lower(right(m.surname, length(m.surname)-1)), ', ',
              upper(left(m.firstname, 1)), lower(right(m.firstname, length(m.firstname)-1)))
/* В данной строке используется функция CONCAT, которая объединяет несколько строк в одну.
Для форматирования имен и фамилий в заданном формате ('Surname, Firstname') используются функции UPPER и LOWER.
   - UPPER(left(m.surname, 1)) берет первую букву фамилии и преобразует ее в верхний регистр.
   - lower(right(m.surname, length(m.surname)-1)) берет оставшуюся часть фамилии (начиная со второй буквы) и преобразует ее в нижний регистр.
   - , добавляет запятую и пробел между фамилией и именем.
   - upper(left(m.firstname, 1)) берет первую букву имени и преобразует ее в верхний регистр.
   - lower(right(m.firstname, length(m.firstname)-1)) берет оставшуюся часть имени (начиная со второй буквы) и преобразует ее в нижний регистр.
*/
  FROM members m /*данные будут извлечены из таблицы "members"*/
