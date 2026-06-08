with zones as (

    select * from {{ ref('stg_zones') }}

),

final as (

    select
        -- fill in the columns
        location_id,
        borough,
        zone,
        service_zone

    from zones

)

select * from final