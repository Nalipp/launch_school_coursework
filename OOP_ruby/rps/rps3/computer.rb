class Computer < Player
  
  def defeat(value)
    return Move.new('paper') if value == 'rock'
    return Move.new('scissors') if value == 'paper'
    return Move.new('rock') if value == 'scissors'
  end

  def analyze(human_history)
    max_key = human_history.max_by { |k,v| v }
    @moves << self.move = defeat(max_key[0])
    @moves.last
  end

  def random_choice
      @moves << self.move = Move.new(['rock', 'paper', 'scissors'].sample)
      @moves.last
  end

  def set_choice(human_history)
    @moves.length < 3 ? random_choice : analyze(human_history)
  end
end
