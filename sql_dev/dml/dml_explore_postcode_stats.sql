select 
  count(*)
from
  dev.national_statistics_postcode_lookup_uk
;

select
  *
from
  dev.national_statistics_postcode_lookup_uk
limit 50
;

select
  distinct "Country Name"
from
  dev.national_statistics_postcode_lookup_uk
;

select
  count(distinct "Local Authority Name")
from
  dev.national_statistics_postcode_lookup_uk
;

select
  distinct "Local Authority Name"
  ,"Country Name"
  ,"Region Name"
from
  dev.national_statistics_postcode_lookup_uk
limit 50
;
  