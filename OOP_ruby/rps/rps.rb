require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def beats?(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def to_s
    @value
  end
end

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
    mv = ''
    loop do
      print "Choose one |   rock   |  paper   | scissors |"
      mv = gets.chomp.downcase
      break if Move::VALUES.include?(mv)
      puts "That is not a valid choice"
    end
    self.move = Move.new(mv)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose_move
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "**********************************************************"
    puts "********  Welcome to Paper Rock Scissors Game!!  *********"
    puts "********             Version   0.2               *********"
    puts "**********************************************************"
  end

  def display_goodbye_message
    puts "**********************************************************"
    puts "******    Bye! Bye!    COME AGAIN     Bye! Bye!    *******"
    puts "**********************************************************"
  end

  def display_moves
    puts "#{human.name}'s choice".ljust(25) +    " |    #{human.move}"
    puts "#{computer.name}'s choice".ljust(25) + " |    #{computer.move}"
  end

  def display_winner
    if human.move.beats?(computer.move)
      puts "#{human.name.upcase} IS THE WINNER!!!"
    elsif computer.move.beats?(human.move)
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
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
    answer == 'y' ? true : false
  end

  def play
    display_welcome_message
    loop do
      human.choose_move
      computer.choose_move
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
