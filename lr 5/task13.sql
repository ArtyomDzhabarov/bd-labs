/*Здесь мы используем оконную функцию ROW_NUMBER, чтобы пронумеровать участников (членов) клуба по дате их регистрации*/
USE cd;
SELECT ROW_NUMBER() OVER (ORDER BY joindate) AS ParticipantNumber,
       memid AS MemberID,
       firstname AS FirstName,
       surname AS LastName
FROM members
ORDER BY ParticipantNumber;