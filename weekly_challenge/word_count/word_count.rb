class Phrase
  attr_reader :words, :counts

  def initialize(phrase)
    @counts = Hash.new
    @words = phrase
  end

  def clean_words
    words.downcase.gsub(/[^a-z'0-9\s( '|' )]/, ' ').gsub(/( '|' )/, ' ').split
  end

  def word_count
    clean_words.uniq.each { |word| counts["#{word}"] = clean_words.count("#{word}") }
    counts
  end
end
