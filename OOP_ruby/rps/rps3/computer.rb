class Computer
  attr_accessor :move

  def set_choice
    self.move = Move.new(['rock', 'paper', 'scissors'].sample)
  end
end
