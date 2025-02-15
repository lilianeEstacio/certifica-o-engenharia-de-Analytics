with state_province as (

    select * from {{ source('adventure_works', 'stateprovince') }}

),

final as (

    select
        cast(stateprovinceid as int) as state_province_id,
        cast(territoryid as int) as terrtory_id,
        cast(stateprovincecode as string) as state_province_code,
        cast(countryregioncode as string) as conuntry_region_code,
        cast(name as string) as state_name
    from state_province

)

select * from final
