class Computer
  attr_accessor :move
  attr_reader :moves

  def initialize
    @moves = []
  end

  def set_choice
      moves << self.move = Move.new(['rock', 'paper', 'scissors'].sample)
      moves.last
  end
end
