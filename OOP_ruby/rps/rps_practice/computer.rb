class Computer < Player
  def choose_move
    self.choice = ['rock', 'paper', 'scissors'].sample
  end
end
