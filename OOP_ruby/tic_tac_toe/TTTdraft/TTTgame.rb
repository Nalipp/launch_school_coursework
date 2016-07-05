require 'pry'

require_relative 'person'
require_relative 'computer'
require_relative 'human'

class TTTgame
  WINNING_COMBOS = ["123", "456", "789", "147", "258", "369", "159", "357"]

  attr_reader :display_board, :board, :human, :computer

  def initialize
    @board = generate_board
    @human = Human.new
    @computer = Computer.new
  end

  def display_message(msg)
    puts "***********************************"
    puts "*"*((32 - msg.size) / 2) +  "  #{msg}  " + "*"*((32 - msg.size) / 2)
    puts "***********************************"
  end

  def generate_board
    board = Hash.new
    (1..9).each { |space| board[space] = " " }
    board
  end

  def tie?
    @board.values.include?(" ") ? false : true
  end

  def winner?(player)
    WINNING_COMBOS.map do |combo|
      return true if combo == combo.chars.select { |char| player.include?(char.to_i) }.join
    end
    false
  end

  def display_board
    puts "   1        |2        |3         "
    puts "            |         |         "
    puts "       #{board[1]}    |    #{board[2]}    |    #{board[3]}    "
    puts "            |         |         "
    puts "   ---------+---------+---------"
    puts "   4        |5        |6        "
    puts "            |         |         "
    puts "      #{board[4]}     |    #{board[5]}    |    #{board[6]}     "
    puts "            |         |         "
    puts "   ---------+---------+---------"
    puts "   7        |8        |9        "
    puts "            |         |         "
    puts "       #{board[7]}    |    #{board[8]}    |    #{board[9]}    "
    puts "            |         |         "
  end

  def refresh_screen
    system "clear"
    display_message("Tic Tac Toe")
    display_board
  end

  def display_result
    puts display_message("Player is the winner!") if winner?(human.marks(board, "O"))
    puts display_message("Computer is the winner!") if winner?(computer.marks(board, "X"))
    puts display_message("It's a tie!") if tie?
  end

  def play
    refresh_screen
    loop do
      human.turn(board)
      display_board
      refresh_screen
      break if winner?(human.marks(board, "O")) || winner?(computer.marks(board, "X")) || tie?
      computer.turn(board)
      display_board
      refresh_screen
      break if winner?(human.marks(board, "O")) || winner?(computer.marks(board, "X")) || tie?
    end
    display_result
  end
end

game = TTTgame.new
game.play
