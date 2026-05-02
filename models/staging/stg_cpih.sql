with source as (

    select * from {{ source('cost_of_living', 'raw_cpih') }}

),

renamed as (

    select
        to_date(time, 'Mon-YY')         as month_date,
        v4_0                             as index_value,
        cpih1dim1aggid                   as category_code,
        aggregate                        as category_name,
        uk_only                          as geography_code,
        geography                        as geography_name

    from source

)

select * from renamed