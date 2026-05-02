with cpih as (

    select * from {{ ref('stg_cpih') }}
    where category_code = 'CP00'

),

final as (

    select
        month_date,
        index_value,
        category_code,
        category_name
    from cpih
    order by month_date

)

select * from final