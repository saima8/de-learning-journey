with trips as (

    select * from {{ ref('stg_trips') }}

),

locations as (

    select * from {{ ref('dim_locations') }}

),

final as (

    select
        
        pickup_location_id,
        dropoff_location_id,
        fare_amount,
        total_amount,
        payment_type,
        pickup_datetime,
        dropoff_datetime,
        rate_code_id,
        trip_distance,
        passenger_count,
        pickup_locations.borough as pickup_borough
        

    from trips
    left join locations as pickup_locations
        on trips.pickup_location_id = pickup_locations.location_id

)

select * from final