USE cd;
SELECT surname, firstname, joindate FROM members WHERE joindate =  (SELECT max(joindate) FROM members); /*выбираем только тот объект, у которого дата регистрации максимальная - поздняя*/