
spark-submit --master $SPARK_MASTER $SPARK_HOME/examples/src/main/ python/wordcount.py spark_cluster.err > wc.result
