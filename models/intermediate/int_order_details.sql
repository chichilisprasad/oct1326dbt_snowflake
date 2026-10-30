WITH orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
),
order_items AS (

    SELECT *
    FROM {{ ref('stg_order_items') }}
),
joined_data AS (

    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        o.order_status,
        o.city,
        o.state,
        o.country,
        o.payment_method,
        oi.product_id,
        oi.product_name,
        oi.quantity,
        oi.price,
        (oi.quantity * oi.price) AS item_total

    FROM orders o
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
)
SELECT *
FROM joined_data
