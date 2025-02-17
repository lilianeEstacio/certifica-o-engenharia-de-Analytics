with country_region as (

    select * from {{ source('adventure_works', 'countryregion') }}

),

renamed as (

    select
        cast(countryregioncode as string) as country_region_id,
        cast(name as string) as country_name
    from country_region

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['country_region_id']) }} as country_region_uid,
        country_region_id,
        country_name
    from renamed
)

select * from final
