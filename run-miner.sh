#!/bin/bash

COMMAND="cargo run --release -- --miner ${MINER_ADDRESS} --trial --verbosity 5"

function exit_node()
{
    echo "Exiting..."
    kill $!
    exit
}

trap exit_node SIGINT

echo "Running miner node..."

while :
do
  echo "Running the node..."
  
  $COMMAND & sleep 3600; kill -INT $! #every 1 hour

  sleep 2;
done
