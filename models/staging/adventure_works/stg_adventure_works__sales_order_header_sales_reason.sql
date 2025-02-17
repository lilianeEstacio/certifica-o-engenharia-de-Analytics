with sales_order_header_sales_reason as (

    select * from {{ source('adventure_works', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        cast(salesorderid as int) as sales_order_id,
        cast(salesreasonid as int) as sales_reason_id
    from sales_order_header_sales_reason

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['sales_order_id']) }} as sales_order_uid,
        {{ dbt_utils.generate_surrogate_key(['sales_reason_id']) }} as sales_reason_uid
    from renamed

)

select * from final