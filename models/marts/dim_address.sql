with address as (

    select * from {{ ref('stg_adventure_works__address') }}

),

state_province as (

    select * from {{ ref('stg_adventure_works__state_province') }}

),

country_region as (

    select * from {{ ref('stg_adventure_works__country_region') }}

),

final as (

    select
        address.address_uid,
        address.postal_code,
        address.address_name,
        address.city_name,
        state_province.state_province_code,
        state_province.state_name,
        country_region.country_name
    from address
    left join state_province on address.state_province_uid = state_province.state_province_uid
    left join country_region on state_province.country_region_uid = country_region.country_region_uid

)

select * from final
