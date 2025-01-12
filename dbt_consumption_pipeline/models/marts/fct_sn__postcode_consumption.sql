select
  postcodes."Postcode 1" as postcode
  ,postcodes."County Name" as county_name
  ,postcodes."Region Name" as region_name
  ,postcodes."Local Authority Name" as local_authority_name
  ,consumption_summary."Electricity Total Consumption (kWh)"
  ,consumption_summary."Gas Total Consumption (kWh)"
  ,consumption_summary."Electricity Mean Consumption (kWh)"
  ,consumption_summary."Gas Mean Consumption (kWh)"
  ,consumption_summary."Electricity Median Consumption (kWh)"
  ,consumption_summary."Gas Median Consumption (kWh)"
  ,consumption_summary."analytics_year"
from
  {{ ref('stg_sn__postcodes') }} as postcodes  
join
    {{ ref('int_sn__consumption_summary') }} as consumption_summary
on 
  postcodes."Postcode 1" = consumption_summary."Postcode"
order by consumption_summary."analytics_year" desc