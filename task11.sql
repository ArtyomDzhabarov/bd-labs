use cd;
select firstname as name from members
UNION
select facility as name from facilities;