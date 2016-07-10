class Player
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end

  def to_s
    @marker
  end
end
