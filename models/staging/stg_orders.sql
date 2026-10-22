
WITH orders AS (
    SELECT
        ORDER_ID AS order_id,
        CUSTOMER_ID AS customer_id,
        PRODUCT_ID AS product_id,
        QUANTITY AS quantity,
        ORDER_DATE AS order_date,
        UPPER(TRIM(STATUS)) AS status

    FROM {{ source('ecommerce_raw', 'ORDERS') }}
)

SELECT *
FROM orders
WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND product_id IS NOT NULL
  AND quantity > 0
