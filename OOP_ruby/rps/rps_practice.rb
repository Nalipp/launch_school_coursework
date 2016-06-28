class Person
  attr_accessor :choice
end

class Human < Person
  attr_accessor :name

  def choose_move
    puts "|    rock     |     paper     |    scissors    |"
    loop do
      print "Choice : "
      self.choice = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors'].include?(self.choice)
      puts "Invalid choice"
    end
  end

  def set_name
    loop do
      print "Enter your name : "
      @name = gets.chomp.downcase
      break unless @name == nil
      puts "Name value required."
    end
  end
end

class Computer < Person
  def choose_move
    self.choice = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    "Welcome to Rock Paper Sissors Game!!"
  end

  def display_moves
    puts "#{@human.name.capitalize} chose".ljust(18) + " |  #{@human.choice}"
    puts "Computer chose     |  #{@computer.choice}"
  end

  def calculate_winner
    @human.choice == 'rock' && @computer.choice == 'scissors' ||
    @human.choice == 'paper' && @computer.choice == 'rock' ||
    @human.choice == 'scissors' && @computer.choice == 'paper'
  end

  def display_game_result
    if @human.choice == @computer.choice
      puts "It's a tie!"
    elsif calculate_winner == true
      puts "YOU ARE THE WINNER!!!"
    else
      puts "Computer wins!"
    end
  end

  def play_again?
    again = ''
    loop do
      print "Play again? [y/n]"
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
    @human.set_name
    loop do
      @human.choose_move
      @computer.choose_move
      display_moves
      display_game_result
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
