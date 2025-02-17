with product_model as (

    select * from {{ source('adventure_works', 'productmodel') }}

),

renamed as (

    select
        cast(productmodelid as int) as product_model_id,
        cast(name as string) as product_model_name
    from product_model

),

final as (

    select
       {{ dbt_utils.generate_surrogate_key(['product_model_id']) }} as product_model_uid,
        product_model_id,
        product_model_name
    from renamed

)

select * from final