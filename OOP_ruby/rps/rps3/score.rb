class Score
  attr_reader :human, :computer

  def initialize
    @human = 0
    @computer = 0
  end

  def update(player)
    player == 'human' ? @human += 1 : @computer += 1
  end

  def reset
    @human = 0
    @computer = 0
  end
end
