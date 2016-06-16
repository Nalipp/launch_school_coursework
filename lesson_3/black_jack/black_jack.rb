require 'pry'

def create_deck
  suits = %w(Hearts Spades Diamonds Clubs)
  values = [*2..10, 'Jack', 'Queen', 'King', 'Ace']
  values.product(suits)
end

CARD_DECK = create_deck
CARD_VALUE_DIC = { "2 " => 2, "3 " => 3, "4 " => 4, "5 " => 5, "6 " => 6,
                   "7 " => 7, "8 " => 8, "9 " => 9, "10" => 10, "Ja" => 10,
                   "Qu" => 10, "Ki" => 10, "Ac" => 11 }.freeze

def initialize_deck
  cards = CARD_DECK
  keys = cards.map { |card| card.join(' ') }
  values = [" "] * keys.length
  zipped = keys.zip(values)
  Hash[zipped]
end

def space
  "***************************"
end

def remaining_cards(deck)
  deck.select { |card, value| card[value] == ' ' }
end

def deal_card(deck, to_player)
  card = remaining_cards(deck).keys.sample
  to_player == '0' ? deck[card.to_s] = "0" : deck[card.to_s] = "1"
  card
end

def hand(deck, plr)
  deck.select { |card, value| card if value == plr }
end

def total(deck, plr)
  card_value = hand(deck, plr).map { |card| card[0][0..1] }
  raw_value = card_value.map { |card| CARD_VALUE_DIC[card] }.inject(:+)

  aces = hand(deck, plr).keys.map { |card| card if card[0] == "A" }.compact
  !aces.empty? && raw_value > 21 ? raw_value - (10 * aces.length) : raw_value
end

def hit(deck, plr)
  deal_card(deck, plr)
end

def busted?(deck, plr)
  total(deck, plr) > 21
end

def display_player_hand(deck)
  puts "Your hand : #{hand(deck, '0').keys.join(', ')}"
  puts "Player total = #{total(deck, '0')}"
end

def dealer_plays(deck, plr)
  puts "Dealer hand : #{hand(deck, '1').keys.join(', ')}"
  while total(deck, plr) <= 17 || total(deck, plr) < total(deck, '0')
    deal_card(deck, plr)
    puts "Dealer hand : #{hand(deck, '1').keys.join(', ')}"
  end
  puts "Dealer total = #{total(deck, plr)}"
end

def return_winner(deck)
  if total(deck, '0') > total(deck, '1')
    puts "PLAYER WINS!!".upcase
  elsif total(deck, '0') < total(deck, '1')
    puts "DEALER WINS!!".upcase
  else
    puts "IT'S A TIE"
  end
end

loop do
  deck = initialize_deck

  puts space
  puts "******  BLACK JACK  *******"
  puts space

  2.times do
    deal_card(deck, '0')
    deal_card(deck, '1')
  end

  display_player_hand(deck)

  show_card = hand(deck, '1').keys[0] # display dealer show card
  puts "Dealer show card : #{show_card}"

  loop do
    puts "hit or stay? [h/s]"
    hit_choice = gets.chomp.downcase

    if hit_choice == 'h'
      puts hit(deck, '0')
      puts space
      display_player_hand(deck)
      if busted?(deck, '0')
        puts 'Player busts! Dealer wins'
        break
      end
    elsif hit_choice == 's'
      puts 'stay'
      puts space
      display_player_hand(deck)
      puts
      dealer_plays(deck, '1')
      if busted?(deck, '1')
        puts 'Dealer busts! You win'
        break
      else
        return_winner(deck)
        break
      end
    end
  end
  puts "Play again? [y/n]"
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
end
