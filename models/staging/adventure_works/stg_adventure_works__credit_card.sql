with credit_card as (

    select * from {{ source('adventure_works', 'creditcard') }}

),

renamed as (

    select
        cast(creditcardid as int) as credit_card_id,
        cast(cardtype as string) as card_type
    from credit_card

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_uid,
        credit_card_id,
        card_type
    from renamed

)

select * from final
