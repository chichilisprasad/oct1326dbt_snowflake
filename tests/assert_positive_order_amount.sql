SELECT
    order_id
FROM {{ ref('stg_orders') }}
WHERE order_amount <= 0