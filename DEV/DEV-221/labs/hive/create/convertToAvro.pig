register /usr/hdp/current/pig-client/lib/avro-1.7.5.jar

customer_records = LOAD '/user/user1/sampledata/customer/'
  AS (cust_id:int, fname:chararray, lname:chararray, state:chararray);

STORE customer_records INTO '/user/user1/sampledata/customer_avro/'
USING AvroStorage ();