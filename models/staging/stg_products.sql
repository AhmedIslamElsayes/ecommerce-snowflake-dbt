WITH products AS (
    SELECT
        PRODUCT_ID AS product_id,
        TRIM(PRODUCT_NAME) AS product_name,
        TRIM(CATEGORY) AS category,
        PRICE AS price
    FROM {{ source('ecommerce_raw', 'PRODUCTS') }}
)

SELECT *
FROM products
WHERE product_id IS NOT NULL
  AND price > 0