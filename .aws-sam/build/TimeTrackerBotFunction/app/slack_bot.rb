require 'httparty'
require 'json'

class SlackBot

  HEADERS = {'content-type' => 'application/json'}

  def self.post_reminder(message, channel)
    webhook_url = ENV['SLACK_WEBHOOK_URL']
    p "webhook url: #{webhook_url}"
    p "payload:\n #{payload(channel)}"
    HTTParty.post(ENV['SLACK_WEBHOOK_URL'], body: payload(channel), headers: HEADERS)
  end

  def self.payload(channel)
    {
        "text":"Reminder to log your time.",
        "channel": channel,
        "attachments": [
            {
                "fallback":"Reminder to log your time at #{ENV['TIME_TRACKING_URL']}",
                "actions":[
                    {
                        "type":"button",
                        "text":"Log time :clock5:",
                        "url": ENV['TIME_TRACKING_URL']
                    }
                ]
            }
        ]
    }.to_json
  end

end