require 'httparty'

class Slacker
  include HTTParty

  attr_reader :slack_hook, :data

  def initialize(slack_hook:, channel: nil, username: nil, icon_emoji: nil)
    @slack_hook = URI(slack_hook)
    @data = {
      channel: channel,
      username: username,
      icon_emoji: icon_emoji
    }
  end

  def send_message(message, attachment_text)
    body = data.merge({
      text: message,
      attachments: [ { text: attachment_text } ]
    }).to_json

    HTTParty.post(slack_hook, { body: body })
  end
end
