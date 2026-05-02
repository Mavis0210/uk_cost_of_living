with source as (

    select * from {{ source('cost_of_living', 'raw_fuel_prices') }}

),

renamed as (

    select
        to_date(date, 'DD/MM/YYYY')                                       as price_date,
        "ulsp_(ultra_low_sulphur_unleaded_petrol)_pump_price_in_pence/li"  as petrol_pump_price_pence,
        "ulsd_(ultra_low_sulphur_diesel)_pump_price_in_pence/litre"        as diesel_pump_price_pence,
        "ulsp_(ultra_low_sulphur_unleaded_petrol)_duty_rate_in_pence/lit"  as petrol_duty_rate_pence,
        "ulsd_(ultra_low_sulphur_diesel)_duty_rate_in_pence/litre"         as diesel_duty_rate_pence,
        "ulsp_(ultra_low_sulphur_unleaded_petrol)_vat_percentage_rate"     as petrol_vat_rate,
        "ulsd_(ultra_low_sulphur_diesel)_vat_percentage_rate"              as diesel_vat_rate

    from source

)

select * from renamed