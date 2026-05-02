with monthly_fuel as (

    select
        date_trunc('month', price_date)::date   as month_date,
        round(avg(petrol_pump_price_pence)::numeric, 2)  as avg_petrol_price_pence,
        round(avg(diesel_pump_price_pence)::numeric, 2)  as avg_diesel_price_pence
    from {{ ref('stg_fuel_prices') }}
    group by 1

),

inflation as (

    select
        month_date,
        index_value as cpih_index
    from {{ ref('stg_cpih') }}
    where category_code = 'CP00'

),

final as (

    select
        i.month_date,
        i.cpih_index,
        f.avg_petrol_price_pence,
        f.avg_diesel_price_pence
    from inflation i
    inner join monthly_fuel f
        on i.month_date = f.month_date
    order by i.month_date

)

select * from final