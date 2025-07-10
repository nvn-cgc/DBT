with bike as (
    select start_statio_id as Station_id
          ,start_statio_id as Station_Name
          ,start_lat as station_lat
          ,start_lng as start_station_lng
    from {{ source('snowflake_dbt', 'bike') }}
)
select * from bike