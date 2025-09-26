SELECT "omni_dbt__stg_orders"."CUSTOMER_ID",
    "omni_dbt__stg_customers"."CUSTOMER_NAME",
    COUNT(DISTINCT "omni_dbt__stg_orders"."ORDER_ID") AS "ORDER_ID_COUNT_DISTINCT",
    MIN("omni_dbt__stg_orders"."ORDERED_AT") AS "ORDERED_AT_MIN",
    MAX("omni_dbt__stg_orders"."ORDERED_AT") AS "ORDERED_AT_MAX",
    COALESCE(SUM("omni_dbt__stg_orders"."ORDER_TOTAL"), 0) AS "ORDER_TOTAL_SUM"
FROM {{ref('stg_orders')}} AS "omni_dbt__stg_orders"
    LEFT JOIN {{ref('stg_customers')}} AS "omni_dbt__stg_customers" ON "omni_dbt__stg_orders"."CUSTOMER_ID" = "omni_dbt__stg_customers"."CUSTOMER_ID"
GROUP BY 2, 1
