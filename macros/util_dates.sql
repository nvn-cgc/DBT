{% macro get_session(x) %}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2)
            THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5)
            THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP({{x}})) in (6,7,8)
            THEN 'SUMMER'
            ELSE 'AUTUMN' 
            END

{% endmacro%}


--macro for end week day
{% macro get_endweekday(x) %}

CASE WHEN DAYNAME(to_timestamp({{x}})) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESS DAY'
    END

{% endmacro%}


--macro for start week day
{% macro get_startweekday(x) %}

CASE
            WHEN DAYNAME(to_timestamp(STARTED_AT)) IN ('Sat', 'Sun') 
            THEN 'WEEKEND'
            ELSE 'BUSINESS DAY'
            END

{% endmacro %}