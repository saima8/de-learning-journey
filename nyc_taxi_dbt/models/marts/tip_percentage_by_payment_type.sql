
with trips as (

    select *
    from {{ ref('fct_trips') }}

),

tip_percentages as (

    select
        payment_type,

        fare_amount,
        tip_amount,

        tip_amount / fare_amount as tip_percentage

    from trips

    where fare_amount > 0
      and tip_amount >= 0

)

select
    payment_type,

    count(*) as total_trips,

    avg(tip_percentage) as avg_tip_percentage,

    round(avg(tip_percentage) * 100, 2) as avg_tip_percentage_display

from tip_percentages

group by payment_type

order by payment_type