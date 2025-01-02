select 
--from  orders
o.orderid, 
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from customer
c.customername,
c.segment,
c.country ,
-- from product
p.category ,
p.productname ,
p.subcategory
from {{ ref('orders') }} as o
left join {{ ref('customer') }} as c
on o.customerid = c.customerid
left join {{ ref('product') }} as p
on o.productid = p.productid