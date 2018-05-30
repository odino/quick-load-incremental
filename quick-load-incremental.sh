#!/bin/bash
SRC="conf.txt"
TARGETS="targets.txt"
if [ -f "$SRC" ]; then
    source ./$SRC
    echo "Loaded configuration from $SRC file."
fi
function attack(){
    RATE=$INITIAL
    echo "Initial rate is: $INITIAL"
    while true; do
      if [ -f $TARGETS ]; then
        set -x
        vegeta attack -targets=$TARGETS -duration $DURATION -rate $RATE | tee results.bin | vegeta report
        set +x
      else
        set -x
        echo "GET $URL" | vegeta attack -duration $DURATION -rate $RATE | tee results.bin | vegeta report
        set +x
      fi
      echo "Waiting $SLEEP seconds"
      sleep $SLEEP
      RATE=$(($RATE+$INCREASE))
      echo "Rate increased to: $RATE"
    done
}
echo -e "Increase: $INCREASE\nWait time: $SLEEP"

attack
