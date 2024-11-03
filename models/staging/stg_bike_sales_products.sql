SELECT 
    PRODUCTKEY,
    PRODUCTNAME,
    STANDARDCOST,
    LISTPRICE,
    DEALERPRICE,
    SAFETYSTOCKLEVEL,
    CURRENTSTOCK,
    DAYSTOMANUFACTURE
FROM {{ source('bike_sales', '"11_PRODUCTS"') }}