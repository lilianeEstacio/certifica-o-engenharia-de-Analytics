with sales_order_detail as (
    select * from {{ ref('stg_adventure_works__sales_order_detail') }}
),

sales_order as (
    select * from {{ ref('stg_adventure_works__sales_order_header') }}
),

final as (
    select
        sales_order_detail.sales_order_detail_uid,
        sales_order_detail.sales_order_uid,
        sales_order.customer_uid,
        sales_order.territory_uid,
        sales_order.bill_to_address_uid,
        sales_order.ship_to_addres_uid,
        sales_order_detail.product_uid,
        sales_order.credit_card_uid,
        sales_order_detail.sales_order_detail_id,
        sales_order.sales_order_id,
        sales_order.order_date,
        sales_order.due_date,
        sales_order.ship_date,
        sales_order.status_name,
        sales_order_detail.order_quantity,
        sales_order_detail.unit_price_value,
        sales_order_detail.unit_price_discount_value,
        sales_order_detail.order_quantity * (sales_order_detail.unit_price_value * (1 - sales_order_detail.unit_price_discount_value)) as total_sales_value
    from sales_order_detail
    inner join sales_order on sales_order_detail.sales_order_uid = sales_order.sales_order_uid
)

select * from final
