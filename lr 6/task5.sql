USE cd;
/*Task-6-5.  Выведите наименования всех объектов клуба заглавными буквами, если они содержат в названии слово ‘Tennis’*/
SELECT upper(f.facility)
  FROM facilities f
  WHERE BINARY facility LIKE '%Tennis%'; /*это условие запроса, которое фильтрует только те записи, в которых поле "facility" содержит слово 'Tennis'. 
  Ключевое слово BINARY указывает на то, что поиск будет чувствителен к регистру.*/

/*оператор SQL, который используется для извлечения данных из базы данных.
- upper(f.facility) - это функция, которая преобразует все символы в поле "facility" таблицы "facilities" в верхний регистр.
- FROM facilities f - указывает, что данные будут извлечены из таблицы "facilities", где "f" является алиасом для таблицы "facilities".*/
