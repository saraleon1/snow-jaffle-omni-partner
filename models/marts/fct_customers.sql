SELECT "dbt_sleon_prod__stg_customers"."CUSTOMER_NAME",
    MIN(DATE_TRUNC('DAY', "dbt_sleon_prod__orders"."ORDERED_AT")) AS "ORDERED_AT_DATE_MIN",
    MAX(DATE_TRUNC('DAY', "dbt_sleon_prod__orders"."ORDERED_AT")) AS "ORDERED_AT_DATE_MAX",
    COUNT(DISTINCT "dbt_sleon_prod__orders"."ORDER_ID") AS "ORDER_ID_COUNT_DISTINCT",
    COALESCE(SUM("dbt_sleon_prod__orders"."ORDER_TOTAL"), 0) AS "ORDER_TOTAL_SUM"
FROM {{ref('orders')}} AS "dbt_sleon_prod__orders"
    LEFT JOIN {{ref('stg_customers')}} AS "dbt_sleon_prod__stg_customers" ON "dbt_sleon_prod__orders"."CUSTOMER_ID" = "dbt_sleon_prod__stg_customers"."CUSTOMER_ID"
GROUP BY 1
