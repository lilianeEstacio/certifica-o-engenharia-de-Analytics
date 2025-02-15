with sales_order_header as (

    select * from {{ source('adventure_works', 'salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as int) as sales_order_id,
        cast(customerid as int) as customer_id,
        cast(salespersonid as int) as sales_person_id,
        cast(territoryid as int) as territory_id,
        cast(billtoaddressid as int) as bill_to_address_id,
        cast(shiptoaddressid as int) as ship_to_addres_id,
        cast(shipmethodid as int) as ship_method_id,
        cast(creditcardid as int) as credit_card_id,
        cast(orderdate as date) as order_date,
        cast(duedate as date) as due_date,
        cast(shipdate as date) as ship_date,
        cast(status as int) as status_code
    from sales_order_header

),

final as (

    select
        sales_order_id,
        customer_id,
        sales_person_id,
        territory_id,
        bill_to_address_id,
        ship_to_addres_id,
        ship_method_id,
        credit_card_id,
        order_date,
        due_date,
        ship_date,
        case status_code
            when 1 then 'In process'
            when 2 then 'Approved'
            when 3 then 'Backordered'
            when 4 then 'Rejected'
            when 5 then 'Shipped'
            when 6 then 'Cancelled'
        end as status_name
    from renamed

)

select * from final

