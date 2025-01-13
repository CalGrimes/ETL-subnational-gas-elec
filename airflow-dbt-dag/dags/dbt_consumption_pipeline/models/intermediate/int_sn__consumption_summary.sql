select
    e.`Postcode`
    ,e.`Total_cons_kwh` as `electricity_total_consumption_kwh`
    ,g.`Total_cons_kwh` as `gas_total_consumption_kwh`
    ,e.`Mean_cons_kwh` as `electricity_mean_consumption_kwh`
    ,g.`Mean_cons_kwh` as `gas_mean_consumption_kwh`
    ,e.`Median_cons_kwh` as `electricity_median_consumption_kwh`
    ,g.`Median_cons_kwh` as `gas_median_consumption_kwh`
    ,e.`analytics_year`
from
    {{ ref('stg_sn__elec') }} as e
left join
    {{ ref('stg_sn__gas') }} as g
on
    e.`Postcode` = g.`Postcode` and
    e.`analytics_year` = g.`analytics_year`