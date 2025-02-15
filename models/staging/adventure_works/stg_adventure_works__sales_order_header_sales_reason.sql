with sales_order_header_sales_reason as (

    select * from {{ source('adventure_works', 'salesorderheadersalesreason') }}

),

final as (

    select
        cast(salesorderid as int) as sales_order_id,
        cast(salesreasonid as int) as sales_reason_id
    from sales_order_header_sales_reason

)

select * from final
