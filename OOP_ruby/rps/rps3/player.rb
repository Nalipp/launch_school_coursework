class Player
  attr_accessor :move
  attr_reader :moves, :history, :history_percents

  def initialize
    @moves = []
  end

  def moves
    @moves.map(&:value)
  end

  def history
    counts = Hash.new(0)
    moves.each { |word| counts[word] += 1 }
    counts
  end

  def history_percents
    total = history.values.inject(:+)
    percent_hash = Hash.new(0)
    self.history.each { |move, value| percent_hash[move] = ((value.to_f / total.to_f) * 100).round(2) }
    percent_hash
  end
end
