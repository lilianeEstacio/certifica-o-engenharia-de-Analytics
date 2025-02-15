with store as (

    select * from {{ source('adventure_works', 'store') }}

),

final as (

    select
        cast(businessentityid as int) as store_id,
        cast(name as string) as store_name
    from store

)

select * from final
