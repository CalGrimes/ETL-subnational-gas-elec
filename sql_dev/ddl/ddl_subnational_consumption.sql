-- drop schema if exists subnational_consumption cascade;
-- drop table if exists dev.national_statistics_postcode_lookup_uk;
-- drop table if exists dev.postcode_level_all_meters_electricity;
-- drop table if exists dev.postcode_level_all_meters_gas;


-- create database if not exists subnational_consumption;
create schema if not exists dev;

create table if not exists dev.national_statistics_postcode_lookup_uk (
	"Postcode 1" varchar(50) null
	,"Postcode 2" varchar(50) null
	,"Postcode 3" varchar(50) null
	,"Date Introduced" int4 null
	,"User Type" int4 null
	,"Easting" int4 null
	,"Northing" int4 null
	,"Positional Quality" int4 null
	,"County Code" varchar(50) null
	,"County Name" varchar(50) null
	,"Local Authority Code" varchar(50) null
	,"Local Authority Name" varchar(50) null
	,"Ward Code" varchar(50) null
	,"Ward Name" varchar(64) null
	,"Country Code" varchar(50) null
	,"Country Name" varchar(50) null
	,"Region Code" varchar(50) null
	,"Region Name" varchar(50) null
	,"Parliamentary Constituency Code" varchar(50) null
	,"Parliamentary Constituency Name" varchar(50) null
	,"European Electoral Region Code" varchar(50) null
	,"European Electoral Region Name" varchar(50) null
	,"Primary Care Trust Code" varchar(50) null
	,"Primary Care Trust Name" varchar(50) null
	,"Lower Super Output Area Code" varchar(50) null
	,"Lower Super Output Area Name" varchar(50) null
	,"Middle Super Output Area Code" varchar(50) null
	,"Middle Super Output Area Name" varchar(50) null
	,"Output Area Classification Code" varchar(50) null
	,"Output Area Classification Name" varchar(128) null
	,"Longitude" float4 null
	,"Latitude" float4 null
	,"Spatial Accuracy" varchar(50) null
	,"Last Uploaded" varchar(50) null
	,"Location" varchar(50) null
	,"Socrata ID" int4 null
);


create table dev.postcode_level_all_meters_electricity (
	"Outcode" varchar(50) null
	,"Postcode" varchar(50) null
	,"Num_meters" int4 null
	,"Total_cons_kwh" float4 null
	,"Mean_cons_kwh" float4 null
	,"Median_cons_kwh" float4 null
	,"analytics_year" int4 null
)
;

create table dev.postcode_level_gas (
	"Outcode" varchar(128) null
	,"Postcode" varchar(128) null
	,"Num_meters" int4 null
	,"Total_cons_kwh" float4 null
	,"Mean_cons_kwh" float4 null
	,"Median_cons_kwh" float4 null
	,"analytics_year" int4 null
)
;