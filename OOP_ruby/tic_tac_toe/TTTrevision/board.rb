class Board
  attr_accessor :find_at_risk_square
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find_at_risk_square
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).select { |square| square.marker.include?("X") }.count == 2
        squares = @squares.select{|k,v| line.include?(k) && v.marker == " " }.keys.first
        return squares if squares != nil
      end
    end
    false
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def draw
    puts "      |      |"
    puts "  #{@squares[1]}   |  #{@squares[2]}   |  #{@squares[3]}   "
    puts "      |      |"
    puts "------+------+------"
    puts "      |      |"
    puts "  #{@squares[4]}   |  #{@squares[5]}   |  #{@squares[6]}   "
    puts "      |      |"
    puts "------+------+------"
    puts "      |      |"
    puts "  #{@squares[7]}   |  #{@squares[8]}   |  #{@squares[9]}   "
    puts "      |      |"
  end
end
