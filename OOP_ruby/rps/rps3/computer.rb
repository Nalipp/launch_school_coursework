class Computer < Player
  def set_choice
    self.move = Move.new(['rock', 'paper', 'scissors'].sample)
  end
end
