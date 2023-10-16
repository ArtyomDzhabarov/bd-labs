use cd;
select * from facilities  where membercost = (select max(membercost) from facilities)
UNION
select * from facilities  where membercost = (select min(membercost) from facilities);