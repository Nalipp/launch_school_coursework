class GuessingGame
  attr_writer = :chances

  def initialize
    @winning_number = rand(99) + 1
    @chances = 7
  end

  def check(num)
    puts "Your guess is too high" if num > @winning_number
    puts "Your guess is too low" if num < @winning_number
    puts "You win!!" if num == @winning_number
  end

  def play
    puts "You have 7 chances remaining"
    loop do
      print 'Enter a number between 1 and 100: '
      guess = gets.chomp.to_i
      loop do
        break if (1..100).include?(guess)
        puts "Invalid Guess. Enter a number between 1 and 100"
        guess = gets.chomp.to_i
      end
      check(guess)
      break if @winning_number == guess
      @chances -= 1
      if @chances == 0
        puts "You are out of guesses, you loose!"
        break
      end
      puts "you have #{@chances} chances remaining"
    end
  end
end

game = GuessingGame.new
game.play
