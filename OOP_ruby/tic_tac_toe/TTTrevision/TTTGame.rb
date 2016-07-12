require 'pry'

require_relative "board"
require_relative "player"
require_relative "square"
require_relative "score"

class TTTGame
  attr_reader :board, :human, :computer, :score

  def initialize
    @first_to_move = []
    @human_marker = []
    @computer_marker = "O"
    @current_marker = nil
    @board = Board.new
    @score = Score.new
  end

  def play
    display_welcome_message
    set_number_of_games
    set_player_marker
    set_player_name
    set_computer_name
    set_first_to_move
    clear
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        display_board_and_clear_screen
      end
      clear
      display_result
      if series_winner?
        display_series_winner
        score.reset
        break
      end
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def set_player_marker
    puts "What marker do you want to use?"
    player_marker = gets.chomp.upcase
    if player_marker == ("" || " ")
      @human_marker = "X"
    elsif player_marker == "O"
      @human_marker = "O"
      @computer_marker = "X"
    else
      @human_marker = player_marker
    end
  end

  def set_first_to_move
    loop do
      puts "Who is first? [c]omputer [h]uman"
      first_player = gets.chomp.downcase
      if first_player == "c"
        @first_to_move = @computer_marker
        @current_marker = @computer_marker
        break
      elsif first_player == "h"
        @first_to_move = @human_marker
        @current_marker = @human_marker
        break
      else
        puts "not a valid choice"
      end
    end
  end

  def set_player_name
    puts "What is your name?"
    player_name = gets.chomp.capitalize
    @human = Player.new(@human_marker, player_name)
  end

  def set_computer_name
    computer_name = ["Dido", "Ernie1", "R2D2", "Obie One", "Prankster"].sample
    @computer = Player.new(@computer_marker, computer_name)
  end

  def series_winner?
    score.human == score.max || score.computer == score.max
  end

  def display_series_winner
    puts score.human == score.max ? "You win series!" : "Computer wins series!"
  end

  def set_number_of_games
    number_of_games = nil
    loop do
      print "How many games? "
      number_of_games = gets.chomp.to_i
      break if number_of_games > 0
      "not a vaid number"
    end
    score.play_until(number_of_games)
  end

  def display_score
    puts score
  end

  def display_goodbye_message
    puts "Good Bye! Thanks for playing!"
  end

  def display_board_and_clear_screen
    clear
    display_board
  end

  def display_board
    display_score
    puts""
    puts " #{human.name} : #{human.marker}"
    puts " #{computer.name} : #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def joinor(arr, symbol=", ", word="or")
    if arr.length > 2
      "#{arr[0..-2].join(symbol.to_s)}#{symbol} #{word} #{arr[-1]}"
    else
      arr.join
    end
  end

  def human_moves
    print "Choose available square #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Not a valid square!"
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.find_winning_square != false
      board[board.find_winning_square] = computer.marker
    elsif board.find_at_risk_square != false
      board[board.find_at_risk_square] = computer.marker
    elsif board.squares[5].marker == " "
      board.squares[5].marker = computer.marker
    elsif board.mark_corner != false
      board[board.mark_corner] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      score.human_plus_one
    when computer.marker
      score.computer_plus_one
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      print 'play again? [y/n]'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "invalid choice"
    end
    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    @current_marker = @first_to_move
  end

  def human_turn?
    @current_marker == @human_marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = @computer_marker
    else
      computer_moves
      @current_marker = @human_marker
    end
  end
end

game = TTTGame.new
game.play
