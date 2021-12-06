with payments as (
    select * from analytics.dbt_pstulnikov.stg_payments
),

orders as (
    select * from analytics.dbt_pstulnikov.stg_orders
),


final as (
    select
        orders.order_id,
        orders.customer_id,
        payments.amount
    
    from orders

    left join payments using (order_id)
)

select * from final