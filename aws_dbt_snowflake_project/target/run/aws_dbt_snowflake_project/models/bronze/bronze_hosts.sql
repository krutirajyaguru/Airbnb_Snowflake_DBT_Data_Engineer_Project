
  
    

create or replace transient table AIRBNB.bronze.bronze_hosts
    
    
    
    as (







SELECT * FROM  airbnb.staging.hosts


    )
;


  