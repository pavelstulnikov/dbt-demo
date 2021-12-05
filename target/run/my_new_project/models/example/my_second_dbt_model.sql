
  create or replace  view raw.dbt_pstulnikov.my_second_dbt_model  as (
    -- Use the `ref` function to select from other models

select *
from raw.dbt_pstulnikov.my_first_dbt_model
where id = 1
  );
