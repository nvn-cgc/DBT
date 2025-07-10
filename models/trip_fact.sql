with trip as (
    select ride_id
          ,rideable_type
          ,date(to_timestamp(started_at)) as trip_date
          ,start_statio_id as strat_station_id
          ,end_station_id
          ,member_csual as member_casual
          ,timestampdiff(second, to_timestamp(started_at),to_timestamp(ended_at))
    from {{ source('snowflake_dbt', 'bike') }}
)
select * from trip