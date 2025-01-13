select
  postcodes.postcode
  ,postcodes.`county_name` as county_name
  ,postcodes.`region_name` as region_name
  ,postcodes.`local_authority_name` as local_authority_name
  ,consumption_summary.`electricity_total_consumption_kwh`
  ,consumption_summary.`gas_total_consumption_kwh`
  ,consumption_summary.`electricity_mean_consumption_kwh`
  ,consumption_summary.`gas_mean_consumption_kwh`
  ,consumption_summary.`electricity_median_consumption_kwh`
  ,consumption_summary.`gas_median_consumption_kwh`
  ,consumption_summary.`analytics_year`
from
  {{ ref('stg_sn__postcodes') }} as postcodes  
join
    {{ ref('int_sn__consumption_summary') }} as consumption_summary
on 
  postcodes.postcode = consumption_summary.`postcode`
order by consumption_summary.`analytics_year` desc