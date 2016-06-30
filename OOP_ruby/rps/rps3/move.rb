class Move
  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def beats?(other)
    rock? && other.scissors? ||
    paper? && other.rock? ||
    scissors? && other.paper?
  end

  def to_s
    @value
  end
end
