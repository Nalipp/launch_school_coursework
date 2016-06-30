require 'pry'

require_relative 'human'
require_relative 'computer'
require_relative 'move'
require_relative 'score'

class RPSGame
  attr_accessor :human, :computer, :score
  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def display_line(value)
    puts "***************    #{value}    ***************"
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
    puts "#{human.name.capitalize} #{score.human}:#{score.computer} Computer"
  end

  def update_score
    if human.move.beats?(computer.move)
      score.update('human')
    elsif computer.move.beats?(human.move)
      score.update('computer')
    end
  end

  def series_winner?(value)
    if score.human >= value
      puts display_line("#{human.name} wins the series!".upcase)
    elsif score.computer >= value
      puts display_line("Computer wins the series!")
    end
    score.human >= value || score.computer >= value ? true : false
  end

  def play_again?(message)
    again = ''
    loop do
      print "#{message}? [y/n] "
      again = gets.chomp.downcase
      break if ['y', 'n'].include?(again)
      puts 'Not a valid choice'
    end
    again == 'y' ? true : false
  end

  def series(series_value)
    loop do
      system "clear"
      display_line('Paper Rock Scissors!!!')
      display_score
      human.set_choice
      computer.set_choice
      display_choices
      display_result
      update_score
      display_score
      break if series_winner?(series_value)
      break unless play_again?('Play again')
    end
  end

  def start
    human.set_name
    loop do
      print "How many games series? "
      series_value = gets.chomp.to_i
      series(series_value)
      score.reset
      break unless play_again?('New series')
    end
  end
end

RPSGame.new.start
