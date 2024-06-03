select
    s.product_id,
    s.year as first_year,
    s.quantity,
    s.price
from
    Sales s
join
    (select product_id, min(year) as first_year
     from Sales
     group by product_id) as sub
on
    s.product_id = sub.product_id and s.year = sub.first_year;
