class GuessingGame
  MESSAGES = { high: "Your guess is too high",
               low: "Your guess is too low",
               win: "You win!!",
               loose: "No more chances left. You loose" }

  def initialize(min, max)
    @range = min..max
    @winning_number = rand(@range)
    @chances = calculate_chances
  end

  def play
    chances_ramaining(@chances)
    @chances.downto(1).each do |num|
      puts results = check_guess(obtain_guess)
      break if results == MESSAGES[:win] || results == MESSAGES[:loose]
      chances_ramaining(num-1)
    end
  end

  private

  def calculate_chances
    size_of_range = @range.max - @range.min
    Math.log2(size_of_range).to_i + 1
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
      print "Guess a number between #{@range.min} and #{@range.max} : "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
      puts "That is an invalid number!"
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
