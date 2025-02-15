with sales_order_detail as (

    select * from {{ source('adventure_works', 'salesorderdetail') }}

),

final as (

    select
        cast(salesorderdetailid as int) as sales_order_detail_id,
        cast(salesorderid as int) as sales_order_id,
        cast(productid as int) as product_id,
        cast(orderqty as int) as order_quantity,
        cast(unitprice as decimal(20,2)) as unit_price_value,
        cast(unitpricediscount as decimal(20,2)) as unit_price_discount_value
    from sales_order_detail

)

select * from final
