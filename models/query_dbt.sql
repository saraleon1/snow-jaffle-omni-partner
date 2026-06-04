SELECT "my_universal_schema_reference__locations"."LOCATION_NAME",
    COUNT(*) AS "COUNT"
FROM "DBT_SLEON"."ORDERS" AS "my_universal_schema_reference__orders"
    LEFT JOIN "DBT_SLEON"."LOCATIONS" AS "my_universal_schema_reference__locations" ON "my_universal_schema_reference__orders"."LOCATION_ID" = "my_universal_schema_reference__locations"."LOCATION_ID"
GROUP BY 1
