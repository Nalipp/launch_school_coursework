# require 'pry'
#
# def create_deck
#   suits = %w[Hearts Spades Diamonds Clubs]
#   values = [*2..10, 'Jack', 'Queen', 'King', 'Ace']
#   deck = values.product(suits)
# end
#
# CARD_DECK = create_deck
#
# def initialize_deck
#   game_deck = CARD_DECK
# end
#
# def deal_card(game_deck, to_player)
#   card = game_deck.delete(game_deck.sample)
#   to_player == '0' ? player_hand(card) : computer_hand(card)
# end
#
# game_deck = initialize_deck
#
# p deal_card(game_deck, '0')


CARD_VALUE_DIC = { "2 " => 2, "3 " => 3, "4 " => 4, "5 " => 5, "6 " => 6,
                   "7 " => 7, "8 " => 8, "9 " => 9, "10" => 10, "Ja" => 10,
                   "Qu" => 10, "Ki" => 10, "Ac" => 1 }

p CARD_VALUE_DIC["2 "]
