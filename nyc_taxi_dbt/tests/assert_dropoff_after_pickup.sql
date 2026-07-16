select *
from {{ ref('fct_trips') }}
where dropoff_datetime < pickup_datetime