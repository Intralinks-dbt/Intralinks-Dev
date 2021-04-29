
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view',  unique_key='id',incremental_strategy='insert_overwrite')}}    


with source_data as (

    select id, email, systemmodstamp, sysdate as activity_date from rap_is_intake.sf_user
     {% if is_incremental() %}
    where systemmodstamp >= (select max(systemmodstamp) from {{this}})
  {% endif %}

)

select *
from source_data
--id= '005F0000002egqTIAQ'

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
