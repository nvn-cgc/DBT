select 
* 
from {{ source('snowflake_dbt', 'bike') }}


limit 10