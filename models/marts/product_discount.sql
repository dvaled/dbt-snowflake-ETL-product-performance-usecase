select 
    PRODUCTKEY,
    AVG(
        case
            when DISCOUNTAMOUNT = 0 then 0
            else (DISCOUNTAMOUNT / UNITPRICE) * 100
        end
    ) AS AVG_DISCOUNT_PERCENTAGE
from {{ ref('stg_bike_sales_sales') }}
GROUP BY PRODUCTKEY