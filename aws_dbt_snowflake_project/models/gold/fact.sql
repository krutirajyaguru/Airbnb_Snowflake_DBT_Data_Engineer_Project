{% set congigs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns" : "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT, 
        GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE",
        "alias" : "GOLD_obt"
    },
    { 
        "table" : "AIRBNB.GOLD.DIMENSION_LISTINGS",
        "columns" : "",
        "alias" : "DIMENSION_listings",
        "join_condition" : "GOLD_obt.listing_id = DIMENSION_listings.listing_id"
    },
    {
        "table" : "AIRBNB.GOLD.DIMENSION_HOSTS",
        "columns" : "",
        "alias" : "DIMENSION_hosts",
        "join_condition" : "GOLD_obt.host_id = DIMENSION_hosts.host_id"
    }
] %}



SELECT 
        {{ congigs[0]['columns'] }}

FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}