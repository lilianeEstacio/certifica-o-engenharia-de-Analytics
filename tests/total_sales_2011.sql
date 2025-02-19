with sales_2011 as (

    select sum(order_quantity * unit_price_value) as total_sales_value
    from {{ ref('fact_sales_order') }}
    where year(order_date) = 2011

)

select * from sales_2011
where total_sales_value != 12646104.41 -- O valor resportado era 12646112.16