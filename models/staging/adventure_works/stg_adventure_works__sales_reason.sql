with sales_reason as (

    select * from {{ source('adventure_works', 'salesreason') }}

),

final as (

    select
        cast(salesreasonid as int) as sales_reason_id,
        cast(name as string) as reason_name,
        cast(reasontype as string) as reason_type
    from sales_reason

)

select * from final
