#!/usr/bin/env bash

#######################################
# ./slack.sh "#random" "bot" "message"
#######################################

WEBHOOKURL="https://hooks.slack.com/services/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"

function post() {
  channel=$1
  username=$2
  shift 2
  text=$*
  PAYLOAD=`cat <<_EOT_
    payload={
      "channel":  "$channel",
      "username": "$username",
      "text":     "$text",
    }
_EOT_`
  curl -s -S -X POST --data-urlencode "${PAYLOAD}" "${WEBHOOKURL}" #> /dev/null
}

if [ $# -eq 3 ]; then
  post $1 $2 $3
else
  post "#random" "bot" "hello, from bash"
fi
