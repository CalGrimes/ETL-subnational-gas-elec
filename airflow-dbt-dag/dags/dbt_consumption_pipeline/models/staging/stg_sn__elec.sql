select
  `Outcode` 
  ,`Postcode`
  ,`Num_meters`
  ,`Total_cons_kwh`  
  ,`Mean_cons_kwh`  
  ,`Median_cons_kwh`
  ,replace(substring_index(_file, '_', -1), '.csv', '') as analytics_year
from
  {{source('sn', 'postcode_level_all_meters_electricity_consolidated')}}