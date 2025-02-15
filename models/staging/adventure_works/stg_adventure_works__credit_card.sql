with credit_card as (

    select * from {{ source('adventure_works', 'creditcard') }}

),

final as (

    select
        cast(creditcardid as int) as credit_card_id,
        cast(cardtype as string) as card_type
    from credit_card

)

select * from final
