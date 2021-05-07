set -e

docker run \
-v "$(pwd)/cqlindex":/cqlindex \
--rm \
--name jk-blacklab \
-p 8888:8080 \
jk-blacklab