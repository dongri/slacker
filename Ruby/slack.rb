require 'net/http'
require 'uri'
require 'json'

def send_message(channel, text)
  uri = URI.parse('https://hooks.slack.com/services/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')
  params = {
    "channel": channel,
    "username": "Bot",
    "text": text,
    "icon_emoji": ":beer:"
  }

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.request_uri)
  req['Content-Type'] = 'application/json'
  payload = params.to_json
  req.body = payload
  res = https.request(req)
  
  puts "code -> #{res.code}"
  puts "body -> #{res.body}"
end

send_message('#random', 'hello, from ruby')
