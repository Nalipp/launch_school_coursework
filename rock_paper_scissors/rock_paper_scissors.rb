VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if player == 'rock' && computer == 'paper' ||
     player == 'paper' && computer == 'scissors' ||
     player == 'scissors' && computer == 'rock'
    prompt('Computer is the winner!!')
  elsif player == 'rock' && computer == 'scissors' ||
        player == 'paper' && computer == 'rock' ||
        player == 'scissors' && computer == 'paper'
    prompt('You are the winner!!')
  else
    prompt('It\'s a tie!!')
  end
end

loop do
  choice = ''
  loop do
    prompt("choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

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

  prompt("Play again? [y/n]")
  play_again = gets.chomp.downcase
  break if play_again == 'n'
end
