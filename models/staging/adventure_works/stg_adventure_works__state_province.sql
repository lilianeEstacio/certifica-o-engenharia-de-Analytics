with state_province as (

    select * from {{ source('adventure_works', 'stateprovince') }}

),

renamed as (

    select
        cast(stateprovinceid as int) as state_province_id,
        cast(territoryid as int) as territory_id,
        cast(stateprovincecode as string) as state_province_code,
        cast(countryregioncode as string) as country_region_code,
        cast(name as string) as state_name
    from state_province

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['state_province_id']) }} as state_province_uid,
        {{ dbt_utils.generate_surrogate_key(['territory_id']) }} as territory_uid,
        {{ dbt_utils.generate_surrogate_key(['country_region_code']) }} as country_region_uid,
        state_province_id,
        state_province_code,
        state_name
    from renamed

)

select * from final