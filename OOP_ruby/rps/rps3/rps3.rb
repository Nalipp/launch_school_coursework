require 'pry'
require_relative 'player'
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

  def display_score
    puts "#{human.name.capitalize} #{human.score}:#{computer.score} Computer"
  end

  def update_score
    if human.move.beats?(computer.move)
      human.score += 1
    elsif computer.move.beats?(human.move)
      computer.score += 1
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def series_winner?
    if human.score > 1
      puts "*************  #{human.name} wins the series!  *************".upcase
    elsif computer.score > 1
      puts "*************  Computer wins the series!  *************"
    end
    human.score > 1 || computer.score > 1 ? true : false
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
    human.set_name
    loop do
      loop do
        system "clear"
        display_intro
        display_score
        human.set_choice
        computer.set_choice
        display_choices
        display_result
        update_score
        display_score
        break if series_winner?
        break unless play_again?
      end
      reset_score
      break unless play_again?
    end
  end
end

RPSGame.new.start
