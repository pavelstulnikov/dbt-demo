

      create or replace transient table analytics.dbt_pstulnikov.fct_orders  as
      (with payments as (
    select * from analytics.dbt_pstulnikov.stg_payments
),

orders as (
    select * from analytics.dbt_pstulnikov.stg_orders
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments

    group by 1

),


final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount
    
    from orders

    left join order_payments using (order_id)
)

select * from final
      );
    