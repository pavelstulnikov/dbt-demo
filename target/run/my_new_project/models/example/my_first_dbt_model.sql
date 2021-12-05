
  create or replace  view raw.dbt_pstulnikov.my_first_dbt_model  as (
    select * from raw.stripe.payment
  );
