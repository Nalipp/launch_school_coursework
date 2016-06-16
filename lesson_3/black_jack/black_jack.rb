require 'pry'

def create_deck
  suits = %w[Hearts Spades Diamonds Clubs]
  values = [*2..10, 'Jack', 'Queen', 'King', 'Ace']
  values.product(suits)
end

CARD_DECK = create_deck
CARD_VALUE_DIC = { "2 " => 2, "3 " => 3, "4 " => 4, "5 " => 5, "6 " => 6,
                   "7 " => 7, "8 " => 8, "9 " => 9, "10" => 10, "Ja" => 10,
                   "Qu" => 10, "Ki" => 10, "Ac" => 11 }

def initialize_deck
  cards = CARD_DECK
  keys = cards.map { |card| card.join(' ')}
  values = [" "] * keys.length
  zipped = keys.zip(values)
  Hash[zipped]
end

def space
  "***************************"
end

def remaining_cards(game_deck)
  game_deck.select { |card, value| card[value] == ' '}
end

def deal_card(game_deck, to_player)
  card = remaining_cards(game_deck).keys.sample
  to_player == '0' ? game_deck["#{card}"] = "0" : game_deck["#{card}"] = "1"
  card
end

def return_hand(game_deck, player)
  game_deck.select { |card, value| card if value == player}
end

def calculate_hand(game_deck, player)
  card_value = return_hand(game_deck, player).map { |card| card[0][0..1] }
  raw_value = card_value.map { |card| CARD_VALUE_DIC[card] }.inject(:+)

  aces = return_hand(game_deck, player).keys.map { |card| card if card[0] == "A" }.compact
  if aces.length > 0 && raw_value > 21
    return raw_value - (10 * aces.length)
  else
    raw_value
  end
end

def hit(game_deck, player)
  deal_card(game_deck, player)
end

def busted?(game_deck, player)
  calculate_hand(game_deck, player) > 21
end

def display_player_hand(game_deck)
  puts "Your hand : #{return_hand(game_deck, '0').keys.join(", ")}"
  puts "Player total = #{calculate_hand(game_deck, '0')}"
end

def dealer_plays(game_deck, player)
puts "Dealer hand : #{return_hand(game_deck, '1').keys.join(", ")}"
  while calculate_hand(game_deck, player) <= 17 || calculate_hand(game_deck, player) < calculate_hand(game_deck, '0')
    deal_card(game_deck, player)
    puts "Dealer hand : #{return_hand(game_deck, '1').keys.join(", ")}"
  end
  puts "Dealer total = #{calculate_hand(game_deck, player)}"
end

def return_winner(game_deck)
  if calculate_hand(game_deck, '0') > calculate_hand(game_deck, '1')
    puts "PLAYER WINS!!".upcase
  elsif calculate_hand(game_deck, '0') < calculate_hand(game_deck, '1')
    puts "DEALER WINS!!".upcase
  else
    puts "IT'S A TIE"
  end
end

loop do
  game_deck = initialize_deck

  puts space
  puts "******  BLACK JACK  *******"
  puts space

  2.times do
    deal_card(game_deck, '0')
    deal_card(game_deck, '1')
  end

  display_player_hand(game_deck)

  show_card = return_hand(game_deck, '1').keys[0] # display dealer show card only
  puts "Dealer show card : #{show_card}"

  loop do
    puts "hit or stay? [h/s]"
    hit_choice = gets.chomp.downcase

    if hit_choice == 'h'
      puts hit(game_deck, '0')
      puts space
      display_player_hand(game_deck)
      if busted?(game_deck, '0')
        puts 'Player busts! Dealer wins'
        break
      end
    elsif hit_choice == 's'
      puts 'stay'
      puts space
      display_player_hand(game_deck)
      puts
      dealer_plays(game_deck, '1')
      if busted?(game_deck, '1')
        puts 'Dealer busts! You win'
        break
      else
        return_winner(game_deck)
        break
      end
    end
  end
  puts "Play again? [y/n]"
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
end
