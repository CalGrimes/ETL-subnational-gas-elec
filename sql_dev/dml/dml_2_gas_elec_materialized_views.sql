--drop materialized view dev.mv_elec_gas_consumption;
--drop materialized view mv_elec_gas_consumption_by_postcode;

create materialized view if not exists dev.mv_elec_gas_consumption as
(
    select
      e."Postcode"
      ,e."Total_cons_kwh" as "Electricity Total Consumption (kWh)"
      ,g."Total_cons_kwh" as "Gas Total Consumption (kWh)"
      ,e."Mean_cons_kwh" as "Electricity Mean Consumption (kWh)"
      ,g."Mean_cons_kwh" as "Gas Mean Consumption (kWh)"
      ,e."Median_cons_kwh" as "Electricity Median Consumption (kWh)"
      ,g."Median_cons_kwh" as "Gas Median Consumption (kWh)"
    from
      dev.postcode_level_gas as g
    left join
      dev.postcode_level_all_meters_electricity as e
    on
        e."Postcode" = g."Postcode"
)
;

create materialized view if not exists dev.mv_elec_gas_consumption_by_postcode as
(
  select
    p."Postcode 1"
    ,p."Local Authority Name"
    ,p."Region Name"
    ,p."County Name"
    ,mv_ge."Electricity Total Consumption (kWh)"
    ,mv_ge."Gas Total Consumption (kWh)"
    ,mv_ge."Electricity Mean Consumption (kWh)"
    ,mv_ge."Gas Mean Consumption (kWh)"
    ,mv_ge."Electricity Median Consumption (kWh)"
    ,mv_ge."Gas Median Consumption (kWh)"
from
   dev.national_statistics_postcode_lookup_uk p
left join
   dev.mv_elec_gas_consumption as mv_ge
on
   p."Postcode 1" = mv_ge."Postcode"
)
;




create materialized view if not exists dev.elec_gas_consumption as
(
    select
        a."Postcode 1",
        a."Postcode 2",
        a."Postcode 3",
        a."Date Introduced",
        a."User Type",
        a."Easting",
        a."Northing",
        a."Positional Quality",
        a."County Code",
        a."County Name",
        a."Local Authority Code",
        a."Local Authority Name",
        a."Ward Code",
        a."Ward Name",
        a."Country Code",
        a."Country Name",
        a."Region Code",
        a."Region Name",
        a."Parliamentary Constituency Code",
        a."Parliamentary Constituency Name",
        a."European Electoral Region Code",
        a."European Electoral Region Name",
        a."Primary Care Trust Code",
        a."Primary Care Trust Name",
        a."Lower Super Output Area Code",
        a."Lower Super Output Area Name",
        a."Middle Super Output Area Code",
        a."Middle Super Output Area Name",
        a."Output Area Classification Code",
        a."Output Area Classification Name",
        a."Longitude",
        a."Latitude",
        a."Spatial Accuracy",
        a."Last Uploaded",
        a."Location",
        a."Socrata ID",
        b."Electricity Consumption (kWh)",
        b."Gas Consumption (kWh)"
    from dev.national_statistics_postcode_lookup_uk a
    left join dev.elec_gas_consumption b
)
;