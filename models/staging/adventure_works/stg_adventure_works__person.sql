with person as (

    select * from {{ source('adventure_works', 'person') }}

),

renamed as (

    select
        cast(businessentityid as int) as person_id,
        cast(coalesce(firstname, '') as string) as first_name,
        cast(coalesce(middlename, '') as string) as middle_name,
        cast(coalesce(lastname, '') as string) as last_name
    from person

),

final AS (

    select
        person_id,
        TRIM(CONCAT(first_name, ' ', middle_name, ' ', last_name)) AS person_name
    from renamed

)

select * from final
