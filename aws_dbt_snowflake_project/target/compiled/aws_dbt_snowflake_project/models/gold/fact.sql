



SELECT 
        GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT, 
        GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE

FROM
    
    
      AIRBNB.GOLD.OBT AS GOLD_obt
    
        
    
        LEFT JOIN AIRBNB.GOLD.DIMENSION_LISTINGS AS DIMENSION_listings
        ON GOLD_obt.listing_id = DIMENSION_listings.listing_id
        
        
    
        LEFT JOIN AIRBNB.GOLD.DIMENSION_HOSTS AS DIMENSION_hosts
        ON GOLD_obt.host_id = DIMENSION_hosts.host_id
        
        