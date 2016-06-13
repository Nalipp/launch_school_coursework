require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('tic_tac_toe.yml')
WINNING_POSITIONS = %w(abc def ghi adg beh cfi aei gec)
@board = { 'a' => ' ', 'b' => ' ', 'c' => ' ', 'd' => ' ', 'e' => ' ', 'f' => ' ',
           'g' => ' ', 'h' => ' ', 'i' => ' ' }

def prompt(message)
  puts " => #{message}"
end

def print_board
  puts
  puts "        |     |      "
  puts "     #{@board['a']}  |  #{@board['b']}  |  #{@board['c']}"
  puts "       a|    b|    c      "
  puts "    - -   - -   - -      "
  puts "        |     |      "
  puts "     #{@board['d']}  |  #{@board['e']}  |  #{@board['f']}"
  puts "       d|    e|    f      "
  puts "    - -   - -   - -      "
  puts "        |     |      "
  puts "     #{@board['g']}  |  #{@board['h']}  |  #{@board['i']}"
  puts "       g|    h|    i      "
  puts
end

def mark_board(letter, player)
  @board["#{letter}"] = "#{player}"
end

def position_selected?(letter)
  (@board["#{letter}"] != ' ') ? true : false
end

def available_positions
  @board.map { |letter, value| letter if value == ' ' }.compact
end

def computer_selection
  selection = available_positions.sample
  mark_board(selection, 'X')
end

def current_positions(player_value)
  @board.map { |position, value| position if value == player_value }.compact.join('')
end

def winner?(player_value)
  WINNING_POSITIONS.include?(current_positions(player_value))
end

def analyze_board
  if winner?('O')
    puts "You are the winner!!!".upcase
    return true
  elsif winner?('X')
    puts "The computer wins!!!".upcase
    return true
  elsif available_positions == []
    puts 'The game is a tie.'
    return true
  end
  false
end

loop do
  puts "**********************************"
  puts "*******  TIC - TAC - TOE  ********"
  puts "**********************************"
  print_board

  loop do
    prompt('choose a square')
    player_selection = gets.chomp.downcase
    if position_selected?(player_selection)
      puts "Not valid, choose again."
    else
      mark_board(player_selection, 'O')
      print_board
      analyze_board
      break
    end
  end
  computer_selection
  print_board
  analyze_board

  if analyze_board
    prompt('Play again? [y/n]')
    play_again = gets.chomp.downcase
    break if play_again != 'y'
  end
end
