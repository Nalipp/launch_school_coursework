class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end
