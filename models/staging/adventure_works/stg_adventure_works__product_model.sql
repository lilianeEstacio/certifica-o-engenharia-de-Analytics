with product_model as (

    select * from {{ source('adventure_works', 'productmodel') }}

),

final as (

    select
        cast(productmodelid as int) as product_model_id,
        cast(name as string) as product_name
    from product_model

)

select * from final
