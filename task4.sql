USE cd;
SELECT facility, membercost FROM facilities WHERE membercost != 0 ; /*выводим только некоторые столбцы и  строки для которых membercost не = 0 с помощью условия после функции WHERE*/