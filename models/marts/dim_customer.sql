with customer as (
    select * from {{ ref('stg_adventure_works__customer') }}
),

store as (
    select * from {{ ref('stg_adventure_works__store') }}
),

person as (
    select * from {{ ref('stg_adventure_works__person') }}
),

final as (
    select 
        customer.customer_uid,
        customer.customer_id,
        coalesce(store.store_name, person.person_name) as customer_name
    from customer
    left join store on customer.store_uid = store.store_uid
    left join person on customer.person_uid = person.person_uid
)

select * from final