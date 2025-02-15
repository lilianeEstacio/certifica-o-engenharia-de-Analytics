with product_category as (

    select * from {{ source('adventure_works', 'productcategory') }}

),

final as (

    select
        cast(productcategoryid as int) as product_category_id,
        cast(name as string) as category_name
    from product_category

)

select * from final
