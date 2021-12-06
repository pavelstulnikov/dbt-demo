with payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

        -- Amount is stored in cents, convert to dollars
        round(1.0 * amount / 100, 4) as amount,
        created as created_at

    from raw.stripe.payment

)

select * from payments