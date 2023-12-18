USE cd;
/*Task-6-6.  Выведите все объектов клуба, если они содержат в названии слово  ‘Tennis’ в произвольном регистре.*/
SELECT f.facility
  FROM facilities f
  WHERE F.facility LIKE '%tEnnis%'
/* - f.facility - указывает, что будет извлечено значение поля "facility" из таблицы "facilities". 
- FROM facilities f - определяет, что данные будут извлечены из таблицы "facilities" с использованием псевдонима "f" для этой таблицы.
- WHERE F.facility LIKE '%tEnnis%' - это условие запроса, которое выбирает только те записи, в которых поле "facility" содержит слово "Tennis" 
в любом регистре посредством использования шаблона поиска с символом '%' и с учетом любых символов до и после слова "Tennis".*/
