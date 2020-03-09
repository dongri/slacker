defmodule MyApp.Slack do

    @webhookurl "https://hooks.slack.com/services/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"

    def send_message(channel, text) do
        post_body = %{"channel" => channel, "username" => "body", "text" => text} |> Poison.encode!
        result = HTTPoison.post(
            @webhookurl,
            post_body,
            [{"Content-Type", "application/json"}]
        )
        # IO.inspect(result)
    end

end
