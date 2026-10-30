{{ config(
    materialized='incremental'
) }}

WITH order_details AS (

    SELECT *
    FROM {{ ref('int_order_details') }}

    {% if is_incremental() %}

        WHERE order_date >
        (
            SELECT MAX(order_date)
            FROM {{ this }}
        )

    {% endif %}

)

SELECT
    order_date,
    state,
    payment_method,

    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(item_total) AS total_sales

FROM order_details

GROUP BY
    order_date,
    state,
    payment_method