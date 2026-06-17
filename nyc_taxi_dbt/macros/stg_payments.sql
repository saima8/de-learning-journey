select 
    PULocationID as pickup_location_id,
    payment_type,

    {{ cents_to_dollars() }} as amount

from {{ ref('stg_trips') }}
