{% snapshot dim_locations_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='location_id',
        strategy='check',
        check_cols=['borough', 'zone', 'service_zone']
    )
}}

select * from {{ ref('stg_zones') }}

{% endsnapshot %}