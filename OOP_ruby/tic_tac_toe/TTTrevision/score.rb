class Score
  attr_reader :human, :computer, :max

  def initialize
    @human = 0
    @computer = 0
    @max = nil
  end

  def human_plus_one
    @human += 1
  end

  def computer_plus_one
    @computer += 1
  end

  def play_until(number_of_games)
    @max = number_of_games
  end

  def reset
    @human = 0
    @computer = 0
  end

  def to_s
    " Player #{human}  |  Computer #{computer}"
  end
end
