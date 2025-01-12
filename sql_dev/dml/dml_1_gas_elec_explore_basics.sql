select
  *
from
  dev.postcode_level_all_meters_electricity
limit 10
;

select
  *
from
  dev.postcode_level_gas
limit 10
;

-- Ensure all data exists from 2023-2015
select
  distinct "analytics_year"
from
  dev.postcode_level_all_meters_electricity
order by 1 desc
;

select
  distinct "analytics_year"
from
  dev.postcode_level_gas
order by 1 desc
;