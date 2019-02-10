import urllib.request
import json

def send_message(channel, text):
  url = 'https://hooks.slack.com/services/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'
  headers = { 'Content-Type': 'application/json; charset=utf-8' }
  method = 'POST'
  data = {
    "channel": channel,
    "username": "Bot",
    "text": text,
    "icon_emoji": ":beer:"
  }
  json_data = json.dumps(data).encode("utf-8")
  req = urllib.request.Request(url=url, data=json_data, headers=headers, method=method)
  res = urllib.request.urlopen(req, timeout=5)
  print("Http status: {0} {1}".format(res.status, res.reason))
  print(res.read().decode("utf-8"))

send_message('#random', 'hello, from python')
