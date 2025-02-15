with product as (

    select * from {{ source('adventure_works', 'product') }}

),

final as (

    select
        cast(productid as int) as product_id,
        cast(productsubcategoryid as int) as product_sub_category_id,
        cast(productmodelid as int) as product_model_id,
        cast(name as string) as product_name
    from product

)

select * from final
