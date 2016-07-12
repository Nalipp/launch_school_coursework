require 'pry'

require_relative 'player'
require_relative 'card'
require_relative 'deck'

class BlackJack
  attr_reader :human, :computer, :deck

  def initialize
    @deck = Deck.new
    @human = Player.new('')
    @computer = Player.new('Dealer')
  end

  def play
    loop do
      clear
      display_banner("Black Jack")
      enter_name
      deal(human, 2)
      deal(computer, 2)
      display_player_round
      human_plays
      clear
      display_player_round
      break if busted?(human) || twenty_one?(human)
      computer_plays
      break
    end
    display_winner
  end

  def display_winner
    [human, computer].each do |player|
      if player.hand_total == 21
        puts "#{player.name} hit 21!!"
      elsif player.hand_total > 21
        puts "#{player.name} busted!!"
      end
    end

    if human.hand_total > computer.hand_total || busted?(computer)
      puts "#{human.name} is the winner!!"
    else
      puts "#{computer.name} is the winner!!"
    end
  end

  def computer_plays
    clear
    puts "Dealer plays ..."
    sleep(1)
    loop do
      display_computer_round
      break if twenty_one?(computer) || busted?(computer)
      break if computer.hand_total > human.hand_total
      if computer.hand_total <= human.hand_total
        deal(computer, 1)
        puts "Dealer hits"
        sleep(2)
        display_computer_round
      end
    end
  end

  def human_plays
    loop do
      break if twenty_one?(human) || busted?(human)
      print '[H]it or [S]tay '
      choice = gets.chomp.downcase
      if choice == 'h'
        deal(human, 1)
        display_player_round
      end
      break if choice == 's'
    end
  end

  def display_computer_round
    clear
    computer.display_hand(computer)
    human.display_hand(human)
    human.display_hand_total(human)
    computer.display_hand_total(computer)
  end

  def display_player_round
    clear
    computer.display_one_card(computer)
    human.display_hand(human)
    human.display_hand_total(human)
  end

  def busted?(player)
    player.hand_total > 21
  end

  def twenty_one?(player)
    player.hand_total == 21
  end

  def clear
    system "clear"
  end

  def deal(player, num)
    num.times { player.hand << deck.deal }
  end

  def enter_name
    loop do
      print "Enter name : "
      name = gets.chomp.capitalize
      @human.name = name
      break
    end
  end

  def display_banner(message)
    stars_length = (46 - message.length) / 2
    puts "*"*50
    puts "*"*stars_length + "  #{message}  " + "*"*stars_length
    puts "*"*50
  end
end

blackjack = BlackJack.new
blackjack.play
