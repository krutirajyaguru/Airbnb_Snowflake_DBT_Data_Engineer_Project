
  
    

create or replace transient table AIRBNB.bronze.bronze_bookings
    
    
    
    as (



SELECT * FROM  airbnb.staging.bookings


    )
;


  