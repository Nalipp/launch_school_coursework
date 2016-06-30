require 'pry'
require_relative 'human'
require_relative 'computer'
require_relative 'move'

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_intro
    puts "***************    Paper Rock Scissors!!!    ***************"
  end

  def display_choices
    puts "#{human.name.capitalize.ljust(8)} : #{human.move}"
    puts "Computer : #{computer.move}"
  end

  def display_result
    if human.move.beats?(computer.move)
      puts "#{human.name} wins!".upcase
    elsif computer.move.beats?(human.move)
      puts "Computer wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    again = ''
    loop do
      print "Play again? [y/n] "
      again = gets.chomp.downcase
      break if ['y', 'n'].include?(again)
      puts 'Not a valid choice'
    end
    again == 'y' ? true : false
  end

  def start
    display_intro
    loop do
      human.set_name
      human.set_choice
      computer.set_choice
      display_choices
      display_result
      break unless play_again?
    end
  end
end

RPSGame.new.start
