
{{ config(materialized='table',  unique_key='user_id',incremental_strategy='insert_overwrite')}}       --sort='contract_id', dist='invited_date') }}


with source_data as (
SELECT 
user_id,
email_address,
contract_id,
business_group_id,
exchange_id,
invited_activated_internal,
invited_pending_internal,
invited_activated_external,
invited_pending_external,
rap_ingest_date,
invited_date,
deleted_date,
SYSDATE as activity_date,
 'IT' as create_user
FROM 
 bireports.v_mtc_invited_current
 -- {% if is_incremental() %}
 --   where invited_date >= (select max(invited_date) from {{this}})
 -- {% endif %}
 )

select *
from source_data

