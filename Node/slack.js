
function sendMessage(channel, text) {
  var request = require('request');
  var options = {
    url: 'https://hooks.slack.com/services/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',
    headers: {
      "Content-type": "application/json",
    },
    json: {
      "channel": channel,
      "username": "Bot",
      "text": text,
      "icon_emoji": ":beer:"
    }
  };
  request.post(options, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      console.log(body.name);
    } else {
      console.log('error: ' + response.statusCode + body);
    }
  });
}

sendMessage('#random', 'hello');
