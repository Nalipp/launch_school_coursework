require 'pry'

class Poker
  FACE_CARDS = { "A" => 14, "K" => 13, "Q" => 12, "J" => 11 }

  def initialize(hand)
    @hands = hand
    @hashed_hands = convert_to_hashes(hand)
  end

  def best_hand
    if tie?
      winning_hand = tie_breaker
      return winning_hand
      # binding.pry

    else
      winning_hand = analyze_hands.max
      winning_index = analyze_hands.find_index(winning_hand)
    end
    [@hands[winning_index]]
  end

  def tie?
    analyze_hands.uniq.length == 1
  end

  def tie_breaker
    if [9, 7, 6, 5, 1].include?(analyze_hands.max)
      index = highest_card.find_index(highest_card.max)
      @hands[index]
    elsif [8, 4, 3, 2].include?(analyze_hands.max)
      only_integers = @hashed_hands.map { |hand| only_integers(hand) }
      winning_combo = only_integers.map do |hand|
        hand.select { |key, value| value == 2 }.max
      end.max
      binding.pry
      @hands.include?(winning_combo[0]).count == winning_combo[1]
    end
  end

  def convert_to_hashes(hands)
    hands.map { |hand| create_hash(hand) }
  end

  def analyze_hands
    @hashed_hands.map { |hash| best_combo(hash) }
  end

  def create_hash(hand)
    return_value = hand.each_with_object(Hash.new(0)) do |value, hash|
      if FACE_CARDS.include?(value[0])
        new_value = FACE_CARDS["#{value[0]}"]
      else
        new_value = value[0]
      end
      hash["#{new_value}"] += 1
      hash["#{value[1]}"] += 1
    end
    return_value
  end

  def only_integers(hash_hand)
    hash_hand.select { |value| value.to_i != 0 }
  end

  def only_suits(hash_hand)
    hash_hand.select { |value| value.to_i == 0 }
  end

  def highest_card
    @hashed_hands.map { |hand| only_integers(hand).keys.max }
  end

  def best_combo(hash_hand)
    return 9 if straight_flush(hash_hand)  #
    return 8 if four_of_a_kind(hash_hand)
    return 7 if full_house(hash_hand)      #
    return 6 if flush(hash_hand)           #
    return 5 if straight(hash_hand)        #
    return 4 if three_of_a_kind(hash_hand)
    return 3 if two_pair(hash_hand)
    return 2 if one_pair(hash_hand)
    return 1
  end

  def straight_flush(hash_hand)
    flush(hash_hand) && straight(hash_hand)
  end

  def four_of_a_kind(hash_hand)
    only_integers(hash_hand).values.max == 4
  end

  def full_house(hash_hand)
    only_integers(hash_hand).values.sort == [2, 3]
  end

  def flush(hash_hand)
    only_suits(hash_hand).values.max == 5
  end

  def straight(hash_hand)
    sorted = only_integers(hash_hand).keys.map(&:to_i).sort
    hand_range = sorted.last - sorted.first
    hand_range == 4 && sorted.uniq.length == 5
  end

  def three_of_a_kind(hash_hand)
    only_integers(hash_hand).values.max == 3
  end

  def two_pair(hash_hand)
    only_integers(hash_hand).values.select { |value| value == 2 }.count == 2
  end

  def one_pair(hash_hand)
    only_integers(hash_hand).values.max == 2
  end
end

straight_to_8 = %w(4S 4H 4S 4D 8H)
flush_to_7 = %w(2S 2S 2S 3S 3S)
game = Poker.new([straight_to_8, flush_to_7])
p game.best_hand
