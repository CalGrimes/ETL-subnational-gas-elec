select
  "Outcode" 
  ,"Postcode"
  ,"Num_meters"
  ,"Total_cons_kwh"  
  ,"Mean_cons_kwh"  
  ,"Median_cons_kwh"  
  ,"analytics_year"
from
  {{source('sn', 'postcode_level_all_meters_electricity')}}