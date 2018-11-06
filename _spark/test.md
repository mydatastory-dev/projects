
module load spark SPARK_MASTER=$(grep "Starting Spark master" *.err | cut -d " " -f 9) spark-submit --master $SPARK_MASTER $SPARK_HOME/examples/src/main/ python/wordcount.py spark_cluster.err > wc.result cat wc.result
