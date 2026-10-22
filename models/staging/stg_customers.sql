SELECT
    CUSTOMER_ID AS customer_id,
    TRIM(CUSTOMER_NAME) AS customer_name,
    LOWER(TRIM(EMAIL)) AS email,
    COALESCE(NULLIF(TRIM(CITY), ''), 'Unknown') AS city,
    SIGNUP_DATE AS signup_date
FROM {{ source('ecommerce_raw', 'CUSTOMERS') }}
WHERE CUSTOMER_ID IS NOT NULL