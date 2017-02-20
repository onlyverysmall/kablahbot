require 'minitest/autorun'
require_relative 'phrase_builder'
require_relative 'slacker'

describe PhraseBuilder do
  before do
    nouns = ['cat']
    verbs = ['meow']
    @builder = PhraseBuilder.new(nouns, verbs, 1)
  end

  describe '#pick' do
    it 'returns the correct number of words' do
      @builder.pick(@builder.nouns).count.must_equal 1
    end
  end

  describe '#phrases' do
    it 'returns a noun-verb string' do
      @builder.phrases.must_equal 'cat meow'
    end
  end
end

describe Slacker do
  before do
    @slacker = Slacker.new(slack_hook: 'https://www.example.com')
  end

  # TODO: make this a real test
  describe '#send_message' do
    it 'sends message to Slack' do
      message = 'Pick a phrase!'
      attachment_text = 'cat meow'

      assert(@slacker.send_message(message, attachment_text))
    end
  end
end
