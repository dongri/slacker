#!/usr/bin/env bash

WEBHOOKURL="https://hooks.slack.com/services/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"

function post() {
  PAYLOAD=$(cat <<EOS
    payload={
      "channel":  "$1",
      "username": "$2",
      "text":     "$3",
    }
  EOS)
  curl -s -S -X POST --data-urlencode "${PAYLOAD}" "${WEBHOOKURL}" > /dev/null
}

if [ $# -eq 3 ]; then
  post $1 $2 $3
else
  post "#random" "bot" "hello, from bash"
fi
