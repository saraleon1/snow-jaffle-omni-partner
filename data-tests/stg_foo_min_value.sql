select * from {{ ref('stg_foo') }}
where mycol < 1