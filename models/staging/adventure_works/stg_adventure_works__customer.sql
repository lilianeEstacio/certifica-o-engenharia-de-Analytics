with customer as (

    select * from {{ source('adventure_works', 'customer') }}

),

renamed as (

    select
        cast(customerid as int) as customer_id,
        cast(personid as int) as person_id,
        cast(storeid as int) as store_id,
        cast(territoryid as int) as territory_id
    from customer

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_uid,
        {{ dbt_utils.generate_surrogate_key(['person_id']) }} as person_uid,
        {{ dbt_utils.generate_surrogate_key(['store_id']) }} as store_uid,
        {{ dbt_utils.generate_surrogate_key(['territory_id']) }} as territory_uid,
        customer_id
    from renamed

)

select * from final
