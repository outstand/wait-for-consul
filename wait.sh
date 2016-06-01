#!/bin/sh
set -e

if [ -z "$CONSUL_HOST" ]; then
  echo 'Unable to find CONSUL_HOST in environment!'
  exit 1
fi

test_consul() {
  [[ "$(curl -qfs http://${CONSUL_HOST}:8500/v1/kv/stockpile/canary | jq -r .[].Value | base64 -d)" = 'tweet' ]]
}

echo 'Waiting for consul to be ready and bootstrapped...'
until test_consul
do
  echo -n .
  sleep 0.2
done
echo
echo 'Consul is ready.'
