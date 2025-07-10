with date_dimention as(
    select RIDE_ID 
          ,date(to_timestamp(STARTED_AT)) as start_date

          ,{{get_startweekday('STARTED_AT')}} AS START_DAY_TYPE

          ,date(to_timestamp(ENDED_AT)) as end_date

          ,{{get_endweekday('ENDED_AT')}} AS END_DAY_TYPE

          ,{{get_session('STARTED_AT')}} AS STATUS_OF_YEAR
            
    from {{ source('snowflake_dbt', 'bike') }}
)
select * from date_dimention