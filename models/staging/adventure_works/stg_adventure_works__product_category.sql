with product_category as (

    select * from {{ source('adventure_works', 'productcategory') }}

),

renamed as (

    select
        cast(productcategoryid as int) as product_category_id,
        cast(name as string) as category_name
    from product_category

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['product_category_id']) }} as product_category_uid,
        product_category_id,
        category_name
    from renamed

)

select * from final
