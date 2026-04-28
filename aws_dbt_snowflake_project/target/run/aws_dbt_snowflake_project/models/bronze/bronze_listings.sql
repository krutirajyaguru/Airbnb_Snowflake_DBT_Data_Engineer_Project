
  
    

create or replace transient table AIRBNB.bronze.bronze_listings
    
    
    
    as (




SELECT * FROM  airbnb.staging.listings


    )
;


  