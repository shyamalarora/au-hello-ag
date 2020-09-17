#!/bin/sh

set -euo pipefail

COMMAND=${1}
FLAGS=""

if [ -z ${DEBUG+x} ]
then 
    FLAGS="${FLAGS} -v"
else 
    FLAGS="${FLAGS} -vvvvv"
fi

echo "Flags"
echo "${FLAGS}"

docker-compose  --log-level ERROR run --rm ${COMMAND}
