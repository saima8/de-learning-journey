with trips as (

    select * from {{ ref('stg_trips') }}

),

locations as (

    select * from {{ ref('dim_locations') }}

),

final as (

    select
        
        vendor_id,
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

select *, {{ rate_code_description('rate_code_id') }} as rate_code_description,
{{ dbt_utils.generate_surrogate_key(['pickup_datetime', 'dropoff_datetime', 'pickup_location_id', 'dropoff_location_id', 'vendor_id', 'trip_distance', 'total_amount']) }} as trip_id,

 from final

