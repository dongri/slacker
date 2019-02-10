package main

import (
	"bytes"
	"log"
	"net/http"
)

func sendMessage(channel, text string) {
	url := "https://hooks.slack.com/services/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"
	jsonStr := `{
		"channel":"` + channel + `",
		"username":"bot",
		"text":"` + text + `",
		"icon_emoji": ":beer:"
	}`
	req, err := http.NewRequest(
		"POST",
		url,
		bytes.NewBuffer([]byte(jsonStr)),
	)
	if err != nil {
		log.Print(err)
	}
	req.Header.Set("Content-Type", "application/json")
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Print(err)
	}
	log.Print(resp)
	defer resp.Body.Close()
}

func main() {
	sendMessage("#random", "hello, from Golang")
}
