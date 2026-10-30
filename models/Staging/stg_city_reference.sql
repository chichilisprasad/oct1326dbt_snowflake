SELECT
    CITY        AS city,
    STATE       AS state,
    COUNTRY     AS country,
    REGION      AS region
FROM {{ ref('city_reference') }}