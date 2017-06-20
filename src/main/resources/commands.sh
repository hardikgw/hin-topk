docker run -it --name=giraph -p 9000:9000 -v $(pwd)/data:/data cithub/giraph
# following inside giraph container
./home/hadoop/hadoop/start.sh
hdfs dfs -mkdir /tmp
cd /data/giraph
hdfs dfs -put tiny-graph.txt /tmp/tiny-graph.txt
hdfs dfs -ls /tmp

$HADOOP_HOME/bin/hadoop jar $GIRAPH_HOME/giraph-examples/target/giraph-examples-1.2.0-hadoop2.jar org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimpleShortestPathsComputation --yarnjars giraph-examples-1.1.0-SNAPSHOT-for-hadoop-2.4.1-jar-with-dependencies.jar --workers 1 --vertexInputFormat org.apache.giraph.io.formats.JsonLongDoubleFloatDoubleVertexInputFormat --vertexInputPath /tmp/tiny-graph.txt -vertexOutputFormat org.apache.giraph.io.formats.IdWithValueTextOutputFormat --outputPath /data