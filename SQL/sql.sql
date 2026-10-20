CREATE DATABASE rainfall_analytics;
use rainfall_analytics;
CREATE TABLE fact_daily_rainfall (
    state VARCHAR(100),
    district VARCHAR(150),
    obj_id DOUBLE,
    date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter VARCHAR(5),
    day_of_week VARCHAR(15),
    season VARCHAR(30),
    actual_mm DECIMAL(12,2),
    normal_mm DECIMAL(12,2),
    anomaly_mm DECIMAL(12,2),
    source_departure_pct DECIMAL(14,2),
    rain_flag TINYINT,
    heavy_rain_flag TINYINT,
    very_heavy_rain_flag TINYINT,
    extreme_rain_flag TINYINT,
    rainfall_intensity VARCHAR(30)
);


CREATE INDEX idx_rain_date
ON fact_daily_rainfall(date);

CREATE INDEX idx_rain_state
ON fact_daily_rainfall(state);

CREATE INDEX idx_rain_district
ON fact_daily_rainfall(district);

CREATE INDEX idx_rain_year
ON fact_daily_rainfall(year);


SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
SHOW TABLES;
LOAD DATA LOCAL INFILE
'C:/Users/abhinand/OneDrive/Desktop/India_Rainfall_Analytics_Project/data/processed/rainfall_daily_clean.csv'
INTO TABLE fact_daily_rainfall
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows FROM fact_daily_rainfall;


SELECT COUNT(DISTINCT state) AS states, COUNT(DISTINCT district) AS districts FROM fact_daily_rainfall;