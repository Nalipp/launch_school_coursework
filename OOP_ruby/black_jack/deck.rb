class Deck
  attr_reader :deck

    SUITS = %w[Hearts Spades Diamonds Clubs]
    RANKS = [*2..10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize
    @deck = []
    create_deck
    @deck.shuffle!
  end

  def create_deck
    SUITS.product(RANKS) { |suit, rank| @deck << Card.new(suit, rank) }
  end

  def deal
    @deck.pop
  end
end
