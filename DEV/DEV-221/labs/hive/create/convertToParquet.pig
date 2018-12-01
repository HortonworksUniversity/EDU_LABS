register /home/user1/parquet-pig-bundle-1.8.1.jar;

customer_records = LOAD '/user/user1/sampledata/customer/'
  AS (cust_id:int, fname:chararray, lname:chararray, state:chararray);

STORE customer_records INTO '/user/user1/sampledata/customer_parquet/'
USING org.apache.parquet.pig.ParquetStorer;