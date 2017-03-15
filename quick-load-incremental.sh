#!/bin/bash
set -x
RATE=$INITIAL

while true; do
  echo "GET $URL" | vegeta attack -duration $DURATION -rate $RATE | tee results.bin | vegeta report
  sleep $SLEEP
  RATE=$(($RATE+$INCREASE))
done
