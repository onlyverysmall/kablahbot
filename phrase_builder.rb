class PhraseBuilder
  attr_reader :nouns, :verbs, :number_phrases

  def initialize(nouns, verbs, number_phrases = 5)
    @nouns = nouns
    @verbs = verbs
    @number_phrases = number_phrases
  end

  def phrases
    pick(nouns).zip(pick(verbs)).map { |a| a.join(' ') }.join(' — ')
  end

  def pick(words)
    words.sample(number_phrases)
  end
end
