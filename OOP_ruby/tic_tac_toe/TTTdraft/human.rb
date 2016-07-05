class Human < Person
  def valid_space?(num_space, board)
    board[num_space] == " "
  end

  def turn(board)
    loop do
      print "Enter a valid square (1-9) "
      num_space = gets.chomp.to_i
      if valid_space?(num_space, board)
        board[num_space] = "O"
        break
      else
        puts "Not a valid square"
      end
    end
  end
end
