
CREATE DATABASE IF NOT EXISTS demo;
USE demo;
DROP TABLE IF EXISTS salary_raw;
DROP VIEW IF EXISTS salary;

CREATE EXTERNAL TABLE salary_raw (
   name string,
   title string,
   salary string,
   travel string,
   orgType string,
   org string,
   year string)
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
 STORED AS TEXTFILE
 LOCATION '/user/user1/data/salary/';

CREATE VIEW salary AS 
  SELECT name, title, 
         CAST(REPLACE(salary, ",", "") AS float) salary, 
         CAST(REPLACE(travel, ",", "") AS float) travel,
         orgType, org, CAST(year AS int) year
    FROM salary_raw;
