with credit_card as (

    select * from {{ ref('stg_adventure_works__credit_card') }}

)

select * from credit_card
