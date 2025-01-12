DO $$ 
DECLARE
    file_record TEXT;
    base_path TEXT := '/data/';
    elec_file_list TEXT[] := ARRAY[
        'Postcode_level_all_meters_electricity_2023.csv',
        'Postcode_level_all_meters_electricity_2022.csv',
        'Postcode_level_all_meters_electricity_2021.csv',
        'Postcode_level_all_meters_electricity_2020.csv',
        'Postcode_level_all_meters_electricity_2019.csv',
        'Postcode_level_all_meters_electricity_2018.csv',
        'Postcode_level_all_meters_electricity_2017.csv',
        'Postcode_level_all_meters_electricity_2016.csv',
        'Postcode_level_all_meters_electricity_2015.csv'
    ];
    year TEXT;
BEGIN
    FOREACH file_record IN ARRAY elec_file_list
    LOOP
        -- Extract year from filename
        year := substring(file_record from '_(\d{4})\.csv$');

        -- Create staging table for electricity
        EXECUTE '
        CREATE TEMP TABLE staging_elec (
            "Outcode" varchar(50) NULL,
            "Postcode" varchar(50) NULL,
            "Num_meters" int4 NULL,
            "Total_cons_kwh" float4 NULL,
            "Mean_cons_kwh" float4 NULL,
            "Median_cons_kwh" float4 NULL
        );';

        -- Copy data from the CSV file into the staging table
        EXECUTE format('COPY staging_elec FROM %L WITH (FORMAT csv, HEADER true);', base_path || file_record);

        -- Insert data from the staging table into the final table with the extracted year
        EXECUTE format('
        INSERT INTO dev.postcode_level_all_meters_electricity (
            "Outcode", "Postcode", "Num_meters", "Total_cons_kwh", "Mean_cons_kwh", "Median_cons_kwh", "analytics_year"
        )
        SELECT 
            "Outcode", "Postcode", "Num_meters", "Total_cons_kwh", "Mean_cons_kwh", "Median_cons_kwh", %L::int AS "analytics_year"
        FROM staging_elec;', year);

        -- Drop the staging table
        EXECUTE 'DROP TABLE staging_elec;';
    END LOOP;
END $$;

-- Load gas table
DO $$ 
DECLARE
    file_record TEXT;
    base_path TEXT := '/data/';
    gas_file_list TEXT[] := ARRAY[
        'Postcode_level_gas_2023.csv',
        'Postcode_level_gas_2022.csv',
        'Postcode_level_gas_2021.csv',
        'Postcode_level_gas_2020.csv',
        'Postcode_level_gas_2019.csv',
        'Postcode_level_gas_2018.csv',
        'Postcode_level_gas_2017.csv',
        'Postcode_level_gas_2016.csv',
        'Postcode_level_gas_2015.csv'
    ];
    year TEXT;
BEGIN
    FOREACH file_record IN ARRAY gas_file_list
    LOOP
        -- Extract year from filename
        year := substring(file_record from '_(\d{4})\.csv$');

        -- Create staging table for gas
        EXECUTE '
        CREATE TEMP TABLE staging_gas (
            "Outcode" varchar(50) NULL,
            "Postcode" varchar(50) NULL,
            "Num_meters" int4 NULL,
            "Total_cons_kwh" float4 NULL,
            "Mean_cons_kwh" float4 NULL,
            "Median_cons_kwh" float4 NULL
        );';

        -- Copy data from the CSV file into the staging table
        EXECUTE format('COPY staging_gas FROM %L WITH (FORMAT csv, HEADER true);', base_path || file_record);

        -- Insert data from the staging table into the final table with the extracted year
        EXECUTE format('
        INSERT INTO dev.postcode_level_gas (
            "Outcode", "Postcode", "Num_meters", "Total_cons_kwh", "Mean_cons_kwh", "Median_cons_kwh", "analytics_year"
        )
        SELECT 
            "Outcode", "Postcode", "Num_meters", "Total_cons_kwh", "Mean_cons_kwh", "Median_cons_kwh", %L::int AS "analytics_year"
        FROM staging_gas;', year);

        -- Drop the staging table
        EXECUTE 'DROP TABLE staging_gas;';
    END LOOP;
END $$;