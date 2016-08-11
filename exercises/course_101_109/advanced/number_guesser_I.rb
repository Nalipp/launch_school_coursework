class GuessingGame
  RANGE = 1..100
  MESSAGES = { high: "Your guess is too high",
               low: "Your guess is too low",
               win: "You win!!",
               loose: "No more chances left. You loose" }
  CHANCES = 7

  def play
    reset
    chances_ramaining(CHANCES)
    CHANCES.downto(0).each do |num|
      puts results = check_guess(obtain_guess)
      break if results == MESSAGES[:win] || results == MESSAGES[:loose]
      chances_ramaining(num)
    end
  end

  private

  def reset
    @winning_number = rand(RANGE)
  end

  def chances_ramaining(num)
    puts num > 0 ? "Chances left : #{num}" : MESSAGES[:loose]
  end

  def check_guess(guess)
    return MESSAGES[:win] if @winning_number == guess
    return MESSAGES[:low] if @winning_number > guess
    return MESSAGES[:high] if @winning_number < guess
  end

  def obtain_guess
    loop do
      print "Guess a number between #{RANGE.min} and #{RANGE.max} : "
      guess = gets.chomp.to_i
      return guess if RANGE.cover?(guess)
      puts "That is an invalid number!"
    end
  end
end

game = GuessingGame.new
game.play
