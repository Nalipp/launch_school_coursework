class Scrabble
  POINTS = { 'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
             'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2,
             'G' => 2, 'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
             'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5,
             'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10 }.freeze

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil? || word == '' || word[/[^a-z^A-Z^]/]
    @word.downcase.chars.inject(0) { |sum, char| sum += points(char) }
  end

  def points(letter)
    return 1 if %w(a e i o u l n r s t).include?(letter)
    return 2 if %w(d g).include?(letter)
    return 3 if %w(c m p).include?(letter)
    return 4 if %w(f h v w y).include?(letter)
    return 5 if %w(k).include?(letter)
    return 8 if %w(j x).include?(letter)
    return 10 if %w(q z).include?(letter)
    return 0
  end

  def self.score(word)
    new(word).score
  end
end
