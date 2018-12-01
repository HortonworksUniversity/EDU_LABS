USE sample;

DROP TABLE IF EXISTS customer_avro;

CREATE EXTERNAL TABLE customer_avro (
     cust_id int, fname string, lname string, state string )
  STORED AS AVRO
  LOCATION '/user/user1/sampledata/customer_avro/';

DROP TABLE IF EXISTS customer_parquet;

CREATE EXTERNAL TABLE customer_parquet (
     cust_id int, fname string, lname string, state string )
  STORED AS PARQUET
  LOCATION '/user/user1/sampledata/customer_parquet/';