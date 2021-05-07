docker run --rm -it \
-v "$(pwd)/texts":/texts \
-v "$(pwd)/cqlindex":/cqlindex \
--name jk-blacklab-indexer \
jk-blacklab-indexer  \
sh -c "cd /texts && ls -lah && \
        cd / && \
java -cp /setup/BlackLab/core/target/blacklab-*.jar nl.inl.blacklab.tools.IndexTool create cqlindex /texts txt"
