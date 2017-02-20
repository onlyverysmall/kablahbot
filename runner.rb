# #!/usr/bin/env ruby
require_relative 'config'
require_relative 'phrase_builder'
require_relative 'slacker'

nouns = YAML.load_file('nouns.yml')
verbs = YAML.load_file('verbs.yml')

phrases = PhraseBuilder.new(nouns, verbs).phrases
message = "Pick a topic, any topic!"

slacker = Slacker.new(
  slack_hook: SLACK_HOOK,
  channel: CHANNEL,
  username: USERNAME,
  icon_emoji: ICON_EMOJI
)

slacker.send_message(message, phrases)
