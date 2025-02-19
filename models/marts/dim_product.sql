with product as (

    select * from {{ ref('stg_adventure_works__product') }}

),

model as (

    select * from {{ ref('stg_adventure_works__product_model') }}

),

category as (

    select * from {{ ref('stg_adventure_works__product_category') }}

),

subcategory as (

    select * from {{ ref('stg_adventure_works__product_subcategory') }}

),

final as (

    select 
        product.product_uid, 
        product.product_id,
        product.product_name,
        model.product_model_name,
        subcategory.subcategory_name,
        category.category_name
    from product
    left join model on product.product_model_uid = model.product_model_uid
    left join subcategory on product.product_sub_category_uid = subcategory.product_sub_category_uid
    left join category on subcategory.product_category_uid = category.product_category_uid

)

select * from final
