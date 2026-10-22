
WITH orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
),

products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
),

customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
)

SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.city,
    o.product_id,
    p.product_name,
    p.category,
    o.quantity,
    p.price AS unit_price,
    o.quantity * p.price AS total_amount,
    o.status

FROM orders o

LEFT JOIN products p
    ON o.product_id = p.product_id

LEFT JOIN customers c
    ON o.customer_id = c.customer_id
