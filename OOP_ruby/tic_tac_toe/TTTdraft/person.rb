class Person
  attr_reader :marks

  def marks(board, symbol)
    board.select { |key, value| key if value == symbol }.keys
  end
end
