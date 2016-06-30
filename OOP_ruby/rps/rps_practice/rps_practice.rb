require_relative 'player'
require_relative 'human'
require_relative 'computer'
require_relative 'move'

class Move
  def initialize(value)
    @value = value
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    "Welcome to Rock Paper Sissors Game!!"
  end

  def display_moves
    puts "Computer : #{computer.choice}"
  end

  def calculate_winner
    human.choice == 'rock' && computer.choice == 'scissors' ||
    human.choice == 'paper' && computer.choice == 'rock' ||
    human.choice == 'scissors' && computer.choice == 'paper'
  end

  def display_game_result
    if human.choice == computer.choice
      puts "It's a tie!"
    elsif calculate_winner == true
      puts "#{human.name.upcase} IS THE WINNER!!!"
    else
      puts "Computer wins!"
    end
  end

  def play_again?
    again = ''
    loop do
      print "Play again? [y/n] "
      again = gets.chomp.downcase
      break if ['y', 'n'].include?(again)
      puts "Invalid selection"
    end
    again == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def play
    display_welcome_message
    human.set_name
    loop do
      human.choose_move
      computer.choose_move
      display_moves
      display_game_result
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
