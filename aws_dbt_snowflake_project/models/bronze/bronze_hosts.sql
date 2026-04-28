{# 
INCREMENTAL_LOAD : to understand logic
{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT'%}

select * from {{ source('staging', 'hosts') }}

{% if incremental_flag == 1 %}
    WHERE {{incremental_col}} > (SELECT COALESCE(MAX ({{ incremental_col }}), '1900-01-01') FROM {{ this }})
{% endif %}
#}

{# INCREMENTAL_LOAD : With DBT Config, is_incremental() is a function in dbt#}


{{ config(materialized='incremental') }}


SELECT * FROM  {{ source('staging', 'hosts') }}

{% if is_incremental() %}
    WHERE CREATED_AT > (SELECT COALESCE(MAX(CREATED_AT), '1900-01-01') FROM {{ this }})
{% endif %}