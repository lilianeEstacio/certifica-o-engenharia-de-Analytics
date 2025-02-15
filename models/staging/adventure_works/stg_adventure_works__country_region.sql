with country_region as (

    select * from {{ source('adventure_works', 'countryregion') }}

),

final as (

    select
        cast(countryregioncode as string) as country_region_id,
        cast(name as string) as country_name
    from country_region

)

select * from final
