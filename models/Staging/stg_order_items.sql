WITH source_data AS (

    SELECT *
    FROM {{ source('RAW_DATA', 'ORDER_ITEMS') }}

)

SELECT
    ORDER_ID          AS order_id,
    PRODUCT_ID        AS product_id,
    PRODUCT_NAME      AS product_name,
    QUANTITY          AS quantity,
    PRICE             AS price

FROM source_data
