require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('tic_tac_toe.yml')
WINNING_POSITIONS = %w(abc def ghi adg beh cfi aei gec).freeze
BOARD = { 'a' => ' ', 'b' => ' ', 'c' => ' ', 'd' => ' ', 'e' => ' ',
          'f' => ' ', 'g' => ' ', 'h' => ' ', 'i' => ' ' }.freeze

def prompt(message)
  puts " => #{message}"
end

def print_board(board)
  puts
  puts "        |     |      "
  puts "     #{board['a']}  |  #{board['b']}  |  #{board['c']}"
  puts "       a|    b|    c      "
  puts "    - -   - -   - -      "
  puts "        |     |      "
  puts "     #{board['d']}  |  #{board['e']}  |  #{board['f']}"
  puts "       d|    e|    f      "
  puts "    - -   - -   - -      "
  puts "        |     |      "
  puts "     #{board['g']}  |  #{board['h']}  |  #{board['i']}"
  puts "       g|    h|    i      "
  puts
end

def mark_board(board, letter, player)
  board[letter.to_s] = player.to_s
end

def position_selected?(board, letter)
  (board[letter.to_s] != ' ') ? true : false
end

def available_positions(board)
  board.map { |letter, value| letter if value == ' ' }.compact
end

def computer_selection(board)
  selection = available_positions(board).sample
  mark_board(board, selection, 'X')
end

def current_positions(board, player_value)
  board.map { |position, val| position if val == player_value }.compact.join('')
end

def winner?(board, player_value)
  WINNING_POSITIONS.include?(current_positions(board, player_value))
end

def analyze_board(board)
  if winner?(board, 'O')
    puts "You are the winner!!!".upcase
    return true
  elsif winner?(board, 'X')
    puts "The computer wins!!!".upcase
    return true
  elsif available_positions(board) == []
    puts 'The game is a tie.'
    return true
  end
  false
end

board = BOARD

loop do
  puts "**********************************"
  puts "*******  TIC - TAC - TOE  ********"
  puts "**********************************"
  print_board(board)

  loop do
    prompt('choose a square')
    player_selection = gets.chomp.downcase
    if position_selected?(board, player_selection)
      puts "Not valid, choose again."
    else
      mark_board(board, player_selection, 'O')
      print_board(board)
      analyze_board(board)
      break
    end
  end
  computer_selection(board)
  print_board(board)
  analyze_board(board)

  if analyze_board(board)
    prompt('Play again? [y/n]')
    play_again = gets.chomp.downcase
    break if play_again != 'y'
  end
end
