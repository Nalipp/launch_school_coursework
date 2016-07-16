class Phrase
  def initialize(phrase)
    @counts = Hash.new
    @words = phrase.downcase.gsub(/[^a-z'0-9\s]/i, '').split
  end

  def word_count
    @words.uniq.each { |word| @counts["#{word}"] = @words.count("#{word}") }
    @counts
  end
end
