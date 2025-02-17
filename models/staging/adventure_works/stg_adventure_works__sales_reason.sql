with sales_reason as (

    select * from {{ source('adventure_works', 'salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as int) as sales_reason_id,
        cast(name as string) as reason_name,
        cast(reasontype as string) as reason_type
    from sales_reason

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['sales_reason_id']) }} as sales_reason_uid,
        sales_reason_id,
        reason_name,
        reason_type
    from renamed

)

select * from final
