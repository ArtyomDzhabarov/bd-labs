USE cd;
SELECT facility, membercost FROM facilities WHERE guestcost = (SELECT MIN(guestcost) FROM facilities)
UNION
SELECT facility, membercost FROM facilities WHERE guestcost = (SELECT MAX(guestcost) FROM facilities);
/*выбираем объекты с максимальной при помощи "MIN" или минимальной при помощи "MAX" стоимостью*/