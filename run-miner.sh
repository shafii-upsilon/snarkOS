#!/bin/bash

COMMAND="cargo run --release -- --miner ${MINER_ADDRESS} --trial --verbosity 2"

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
  
  $COMMAND & sleep 36000; kill -INT $! #every 10 hour

  sleep 2;
done
