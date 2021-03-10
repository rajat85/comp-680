# frozen_string_literal: true
#
require 'httparty'
require 'json'

class SlackBot

  HEADERS = {'content-type' => 'application/json'}

  def self.post_reminder(message, channel)
    webhook_url = ENV['SLACK_WEBHOOK_URL']
    p "payload:\n #{payload(channel)}"
    HTTParty.post(ENV['SLACK_WEBHOOK_URL'], body: payload('rnd'), headers: HEADERS)
  end

  def self.payload(channel)
    {
        "text": ":warning: Here is the log from CloudWatch that needs your attention. \n",
        "channel": channel,
        "attachments": [
            {
                "fallback":"Please see the details at #{ENV['TIME_TRACKING_URL']}",
                "actions":[
                    {
                        "type": "button",
                        "text": "Log details :clock5:",
                        "url": ENV['TIME_TRACKING_URL']
                    }
                ]
            }
        ]
    }.to_json
  end

end
