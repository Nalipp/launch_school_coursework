class Move
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def beats?(other)
    value == 'rock' && other.value == 'scissors' ||
    value == 'paper' && other.value == 'rock' ||
    value == 'scissors' && other.value == 'paper'
  end

  def to_s
    @value
  end
end
