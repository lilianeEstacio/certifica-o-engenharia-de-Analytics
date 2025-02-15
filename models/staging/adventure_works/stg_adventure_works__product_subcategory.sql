with product_subcategory as (

    select * from {{ source('adventure_works', 'productsubcategory') }}

),

final as (

    select
        cast(productsubcategoryid as int) as product_sub_category_id,
        cast(productcategoryid as int) as product_category_id,
        cast(name as string) as subcategory_name
    from product_subcategory

)

select * from final
