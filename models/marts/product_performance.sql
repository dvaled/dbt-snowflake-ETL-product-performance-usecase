select
    p.PRODUCTKEY,
    p.PRODUCTNAME,
    ps.TOTAL_SALES_VOLUME,
    ps.TOTAL_REVENUE,
    pp.TOTAL_PRODUCT_COST,
    pp.PROFIT_MARGIN,
    pd.AVG_DISCOUNT_PERCENTAGE,
    p.CURRENTSTOCK,
    P.SAFETYSTOCKLEVEL,
    case when p.CURRENTSTOCK < p.SAFETYSTOCKLEVEL then 1 else 0 end as STOCK_BELOW_SAFETY_LEVEL,
    p.DAYSTOMANUFACTURE
from 
    {{ ref('product_sales_summary') }} as ps
join
    {{ ref('product_profit') }} as pp
        on ps.PRODUCTKEY = pp.PRODUCTKEY
join
    {{ ref('product_discount') }} as pd
        on ps.PRODUCTKEY = pd.PRODUCTKEY
join
    {{ ref('stg_bike_sales_products') }} as p
        on ps.PRODUCTKEY = p.PRODUCTKEY