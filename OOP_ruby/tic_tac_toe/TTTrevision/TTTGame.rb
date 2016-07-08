require 'pry'

require_relative "board"
require_relative "player"
require_relative "square"
require_relative "score"

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @score = Score.new
  end

  def play
    display_welcome_message
    set_number_of_games
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

  def series_winner?
    score.human == score.max || score.computer == score.max
  end

  def display_series_winner
    puts score.human == score.max ? "You win the series!" : "Computer wins the series!"
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
    puts " You're a #{human.marker}"
    puts " Computer is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def joinor(arr, symbol=", ", word="or")
    if arr.length > 2
      "#{arr[0..-2].join("#{symbol}")}#{symbol} #{word} #{arr[-1]}"
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
    board[board.unmarked_keys.sample] = computer.marker
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
    @current_marker = FIRST_TO_MOVE
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end
end

game = TTTGame.new
game.play
