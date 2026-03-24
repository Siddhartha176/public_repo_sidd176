
  
    

    create or replace table `theta-window-375314`.`dbt_ays176`.`stg_customers`
    
    
    OPTIONS()
    as (
      select
    id as customer_id,
    first_name,
    last_name

from `dbt-tutorial`.jaffle_shop.customers
    );
  