require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
GAME_MODE = "choose"

def prompt(message)
  puts " => #{message}"
end

def initialize_score
  player_score = 0
  computer_score = 0
  [player_score, computer_score]
end

def update_score(winner, score)
  score[0] += 1 if winner == 'Player'
  score[1] += 1 if winner == 'Computer'
  display_score(score[0], score[1])
end

def display_score(player_score, computer_score)
  puts "Player : #{player_score}   Computer : #{computer_score}"
end

def display_board(brd)
  system "clear"
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def join_or(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr[-1]}" if arr.length > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def place_piece!(board, current_player)
  current_player == '1' ? player_selects_square!(board) : computer_selects_square!(board)
end

def player_selects_square!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{join_or(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if brd[square] == INITIAL_MARKER
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(line[0], line[1], line[2]).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first
  else
    nil
  end
end

def computer_selects_square!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
   WINNING_LINES.each do |line|
     square = find_at_risk_square(line, brd, PLAYER_MARKER)
     break if square
   end
 end

  if !square
    brd[5] == ' ' ? square = 5 : square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def tie?(board)
  empty_squares(board).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  current_player == '1' ? '2' : '1'
end

if GAME_MODE == "choose"
  prompt "Choose first player : (1) Player  (2) Computer"
  first_turn = gets.chomp
end

current_player = first_turn
score = initialize_score

loop do
  board = initialize_board
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if winner?(board) || tie?(board)
  end

  display_board(board)

  if winner?(board)
    prompt "#{detect_winner(board)} is the winner!".upcase
    update_score("#{detect_winner(board)}", score)
    if score[0] > 5 || score[1] > 5
      prompt "#{detect_winner(board)} wins series of 5!!! game over".upcase
    end
  else
    prompt "It's a tie!"
  end
  prompt "Do you want to play again? [y/n]"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe!'
