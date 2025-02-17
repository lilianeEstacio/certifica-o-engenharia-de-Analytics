with store as (

    select * from {{ source('adventure_works', 'store') }}

),

renamed as (

    select
        cast(businessentityid as int) as store_id,
        cast(name as string) as store_name
    from store

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['store_id']) }} as store_uid,
        store_id,
        store_name
    from renamed

)

select * from final
