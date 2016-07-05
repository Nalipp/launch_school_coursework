class Computer < Person
  def turn(board)
    num_space = board.select { |key, value| key if value == ' ' }.keys.sample
    board[num_space] = "X"
  end
end
