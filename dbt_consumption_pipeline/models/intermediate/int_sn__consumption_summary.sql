select
      e."Postcode"
      ,e."Total_cons_kwh" as "Electricity Total Consumption (kWh)"
      ,g."Total_cons_kwh" as "Gas Total Consumption (kWh)"
      ,e."Mean_cons_kwh" as "Electricity Mean Consumption (kWh)"
      ,g."Mean_cons_kwh" as "Gas Mean Consumption (kWh)"
      ,e."Median_cons_kwh" as "Electricity Median Consumption (kWh)"
      ,g."Median_cons_kwh" as "Gas Median Consumption (kWh)"
    from
      {{ ref('stg_sn__elec') }} as e
    left join
        {{ ref('stg_sn__gas') }} as g
    on
        e."Postcode" = g."Postcode"