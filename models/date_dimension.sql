with date_dimention as(
    select RIDE_ID 
          ,date(to_timestamp(STARTED_AT)) as start_date

          ,CASE
            WHEN DAYNAME(to_timestamp(STARTED_AT)) IN ('Sat', 'Sun') 
            THEN 'WEEKEND'
            ELSE 'BUSINESS DAY'
            END AS START_DAY_TYPE

          ,date(to_timestamp(ENDED_AT)) as end_date

          ,CASE
            WHEN DAYNAME(to_timestamp(ENDED_AT)) IN ('Sat', 'Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESS DAY'
            END AS END_DAY_TYPE

          ,CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
            THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
            THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
            THEN 'SUMMER'
            ELSE 'AUTUMN' 
            END AS STATION_OF_YEAR
            
    from {{ source('snowflake_dbt', 'bike') }}
)
select * from date_dimention