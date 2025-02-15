with address as (

    select * from {{ source('adventure_works', 'address') }}

),

final as (

    select
        cast(addressid as int) as address_id,
        cast(stateprovinceid as string) as state_province_id,
        cast(addressline1 as string) as address_name,
        cast(city as string) as city_name,
        cast(postalcode as string) as postal_code
    from address

)

select * from final
