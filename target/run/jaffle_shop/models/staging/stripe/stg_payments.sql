
  create or replace  view analytics.dbt_pstulnikov.stg_payments  as (
    with payments as (
    select
        orderid as order_id,
        amount

    from raw.stripe.payment

)

select * from payments
  );
