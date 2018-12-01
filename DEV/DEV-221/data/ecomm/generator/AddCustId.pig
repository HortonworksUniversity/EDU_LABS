REGISTER '/usr/hdp/current/pig-client/lib/datafu.jar';
DEFINE Enumerate datafu.pig.bags.Enumerate('1000000');

without_ids = LOAD '/user/user1/perf/1/working/genMillionCusts' 
    USING PigStorage('\t')
    AS (fname:chararray, lname:chararray, state:chararray);

grp_all = GROUP without_ids ALL;
with_cust_id = FOREACH grp_all
	{
		with_enumeration = Enumerate(without_ids);
		GENERATE FLATTEN(with_enumeration);
	}

id_first = FOREACH with_cust_id GENERATE $3 AS cust_id, $0 AS fname, $1 AS lname, $2 AS state;

STORE id_first INTO '/user/user1/perf/1/customer' 
     USING PigStorage('\t');