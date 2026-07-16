with source as (

    select * from read_parquet('{{ env_var("TAXI_DATA_PATH", "data/yellow_tripdata_2025-01.parquet") }}')

),

renamed as (

    select
        -- identifiers
        VendorID                    as vendor_id,
        RatecodeID                  as rate_code_id,
        PULocationID                as pickup_location_id,
        DOLocationID                as dropoff_location_id,

        -- timestamps
        tpep_pickup_datetime        as pickup_datetime,
        tpep_dropoff_datetime       as dropoff_datetime,

        -- trip info
        passenger_count,
        trip_distance,
        store_and_fwd_flag,

        -- payment
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        Airport_fee

    from source
    where trip_distance > 0
    and total_amount > 0
    and passenger_count > 0
    and rate_code_id != 99
    and rate_code_id is not null
    and tpep_dropoff_datetime > tpep_pickup_datetime

)

select * from renamed