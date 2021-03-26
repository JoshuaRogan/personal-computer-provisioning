#!/bin/bash
while :
do
  curl 'https://www.predictit.org/api/marketdata/markets/2721' | jq '.contracts[] | { contract: .shortName, current: .lastTradePrice }'
	sleep 10
done
