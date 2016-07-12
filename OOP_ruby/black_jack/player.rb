class Player
  attr_accessor :name

  def initialize(name)
    @name = name
    @hand = []
  end

  def border
    "+" + "-"*18 + "+"
  end

  def display_one_card(player)
    puts "#{player.name} showing"
    puts border
    puts "|  " + "#{@hand.first}".ljust(14) + "  |"
    puts border
    puts border
    puts "|  private         |"
    puts border
  end

  def display_hand(player)
    puts "#{player.name} showing"
    @hand.each do |card|
      puts border
      puts "|  " + "#{card}".ljust(14) + "  |"
      puts border
    end
  end

  def hand_total
    total = 0
    @hand.each do |card|
      if card.rank == 'Jack'
        total += 10
      elsif card.rank == "Queen"
        total += 10
      elsif card.rank == "King"
        total += 10
      elsif card.rank == "Ace"
        total += 11
      else
        total += card.rank
      end
    end
    total
  end

  def display_hand_total(player)
    puts "Hand total for #{player.name.capitalize} : #{hand_total}"
  end

  def hand
    @hand
  end
end
