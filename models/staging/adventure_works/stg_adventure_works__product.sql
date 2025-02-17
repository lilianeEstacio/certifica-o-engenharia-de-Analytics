with product as (

    select * from {{ source('adventure_works', 'product') }}

),

renamed as (

    select
        cast(productid as int) as product_id,
        cast(productsubcategoryid as int) as product_sub_category_id,
        cast(productmodelid as int) as product_model_id,
        cast(name as string) as product_name
    from product

),


final as (

    select
        {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_uid,
        {{ dbt_utils.generate_surrogate_key(['product_sub_category_id']) }} as product_sub_category_uid,
        {{ dbt_utils.generate_surrogate_key(['product_model_id']) }} as product_model_uid,
        product_id,
        product_name
    from renamed

)

select * from final
