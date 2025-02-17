with product_subcategory as (

    select * from {{ source('adventure_works', 'productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as product_sub_category_id,
        cast(productcategoryid as int) as product_category_id,
        cast(name as string) as subcategory_name
    from product_subcategory

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['product_sub_category_id']) }} as product_sub_category_uid,
        {{ dbt_utils.generate_surrogate_key(['product_category_id']) }} as product_category_uid,
        product_sub_category_id,
        subcategory_name
    from renamed

)

select * from final