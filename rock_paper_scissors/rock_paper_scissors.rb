VALID_CHOICES = %w(rock paper scissors lizard spock)

@player_score = 0
@computer_score = 0

ABR = { 'r' => 'rock',
        'p' => 'paper',
        'sc' => 'scissors',
        'sp' => 'spock',
        'l' => 'lizard' }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'rock' && second == 'lizard' ||

    first == 'scissors' && second == 'paper' ||
    first == 'scissors' && second == 'lizard' ||

    first == 'spock' && second == 'rock' ||
    first == 'spock' && second == 'scissors' ||

    first == 'paper' && second == 'rock' ||
    first == 'paper' && second == 'spock' ||

    first == 'lizard' && second == 'spock' ||
    first == 'lizard' && second == 'paper'
end

def return_score
  prompt("Your score     : #{@player_score}")
  prompt("Computer score : #{@computer_score}")
end

def plus_one(winner)
  (winner == 'player') ? @player_score += 1 : @computer_score += 1
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You are the winner!!')
    plus_one('player')
  elsif win?(computer, player)
    prompt('Computer is the winner!!')
    plus_one('computer')
  else
    prompt('It\'s a tie!!')
  end
  return_score
end

loop do
  choice = ''
  loop do
    prompt("choose one: ")
    ABR.each { |abr, full_word| puts "#{abr.ljust(2)} : #{full_word}" }
    abr = gets.chomp
    choice = ABR[abr]

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice!!")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("Your choice       : #{choice}")
  prompt("Computer's choice : #{computer_choice}")

  display_results(choice, computer_choice)

  if @player_score > 4
    puts "YOU ARE THE WINNER!!"
    break
  end

  if @computer_score > 4
    puts "COMPUTER IS THE WINNER!!"
    break
  end
end
