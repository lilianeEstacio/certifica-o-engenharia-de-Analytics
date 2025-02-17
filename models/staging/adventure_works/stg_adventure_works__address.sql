with address as (

    select * from {{ source('adventure_works', 'address') }}

),

renamed as (

    select
        cast(addressid as int) as address_id,
        cast(stateprovinceid as string) as state_province_id,
        cast(addressline1 as string) as address_name,
        cast(city as string) as city_name,
        cast(postalcode as string) as postal_code
    from address

),
 
final as (

    select
        {{ dbt_utils.generate_surrogate_key(['address_id']) }} as address_uid,
        {{ dbt_utils.generate_surrogate_key(['state_province_id']) }} as state_province_uid,
        address_id,
        address_name,
        city_name,
        postal_code
    from renamed

)

select * from final
