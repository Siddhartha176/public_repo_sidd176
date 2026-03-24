
  
    

    create or replace table `theta-window-375314`.`dbt_ays176`.`stg_orders`
    
    
    OPTIONS()
    as (
      select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from `dbt-tutorial`.jaffle_shop.orders
    );
  