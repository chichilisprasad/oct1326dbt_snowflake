WITH source_data AS (

    SELECT *
    FROM {{ source('RAW_DATA', 'orders') }}

)

SELECT
    ORDER_ID AS order_id,
    CUSTOMER_ID AS customer_id,
    ORDER_DATE AS order_date,
    STATUS AS order_status,
    AMOUNT AS order_amount,

    {{ standardize_payment_method('PAYMENT_METHOD') }}
        AS payment_method

FROM source_data