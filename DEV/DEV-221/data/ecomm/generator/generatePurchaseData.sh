mkdir tmpJson
hdfs dfs -mkdir perf/1/purchase
javac GenJsonCfg.java

for i in {01..31}
do
	java GenJsonCfg /home/user1/genPurch/ 2018-07-$i
done

mv tmpJson purchaseJson
hdfs dfs -put purchaseJson perf/1/working

cd /labfiles/util/hdp-data-gen/bin

for dd in {01..20}
do
        for hh in {00..23}
        do
                ./rungentool.sh -count 300000 -jsonCfg perf/1/working/purchaseJson/2018-07-${dd}_${hh}.json -mappers 1 -sink HDFS -output perf/1/purchase/2018-07-${dd}_${hh} &
                sleep 6 
        done
done

cd ~/genPurch