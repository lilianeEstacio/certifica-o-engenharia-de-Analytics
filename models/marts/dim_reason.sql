with reason as (

    select * from {{ ref('stg_adventure_works__sales_reason') }}

),

link as (

    select * from {{ ref('stg_adventure_works__sales_order_header_sales_reason') }}

),

order_detail as (

    select * from {{ ref('stg_adventure_works__sales_order_detail') }}

),

final as (

    select
        order_detail.sales_order_detail_uid,
        reason.reason_type,
        reason.reason_name
    from reason
    inner join link on reason.sales_reason_uid = link.sales_reason_uid
    inner join order_detail on link.sales_order_uid = order_detail.sales_order_uid

)

select * from final
