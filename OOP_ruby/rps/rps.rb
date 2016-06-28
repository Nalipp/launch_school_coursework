require 'pry'

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      print "Enter your name : "
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose_move
    loop do
      print "Choose one                |    rock    |   paper    |  scissors  |     "
      self.move = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors'].include?(self.move)
      puts "That is not a valid choice"
    end
    self.move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose_move
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end


class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "**************************************************************************"
    puts "****************  Welcome to Paper Rock Scissors Game!!  *****************"
    puts "****************             Version   0.2               *****************"
    puts "**************************************************************************"
  end

  def display_goodbye_message
    puts "**************************************************************************"
    puts "**************    Bye! Bye!    COME AGAIN     Bye! Bye!    ***************"
    puts "**************************************************************************"
  end

  def display_winner
    puts "#{human.name}'s choice".ljust(25) +    " |    #{human.move}"
    puts "#{computer.name}'s choice".ljust(25) + " |    #{computer.move}"

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name.upcase} IS THE WINNER!!!" if computer.move == 'scissors'
      puts "#{computer.name} wins!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name.upcase} IS THE WINNER!!!" if computer.move == 'rock'
      puts "#{computer.name} wins!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name.upcase} IS THE WINNER!!!" if computer.move == 'paper'
      puts "#{computer.name} wins!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = ''
    loop do
      print "Play again? [y/n]"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "That is not a valid choice"
    end
    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose_move
      computer.choose_move
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

new_game = RPSGame.new.play
