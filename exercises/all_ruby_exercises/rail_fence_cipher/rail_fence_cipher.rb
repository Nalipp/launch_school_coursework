class RailFenceCipher
  def self.encode(string, num_of_rails)
    gaps_arr = find_gaps(num_of_rails)

    gaps_arr.each_with_index.map do |gaps, index|
      encode_single_rail(string, index, gaps[0], gaps[1])
    end.flatten.join
  end

  def self.find_gap_range(num_of_rails)
    count = 0
    num_of_rails.times { count += 2 }
    range = (2..count - 2).select(&:even?)
  end

  def self.find_gaps(num_of_rails)
    range = find_gap_range(num_of_rails)

    result = []
    range.last.downto(2) do |num|
      if num.even? && num != range.last
        gap1 = num
        gap2 = range.last - gap1.to_i
        result << [gap1, gap2]
      elsif num == range.last
        result << [num, num]
      end
    end
    result << [range.last, range.last]
  end

  def self.encode_single_rail(string, starting_index, gap1, gap2)
    result = []
    current_gap = gap2
    count = starting_index
    while string.chars[count] != nil
      result << string.chars[count]
      current_gap == gap1 ? current_gap = gap2 : current_gap = gap1
      count += current_gap
    end
    result
  end
end


# RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3) = 'WECRLTEERDSOEEFEAOCAIVDEN'

# W . . . E . . . C . . . R . . . L . . . T . . . E   4, 4
# . E . R . D . S . O . E . E . F . E . A . O . C .   2, 2
# . . A . . . I . . . V . . . D . . . E . . . N . .   4, 4

# W . . . . . I . . . . . R . . . . . E . . . . . E   6, 6
# . E . . . D . S . . . E . E . . . E . A . . . C .   4, 2
# . . A . E . . . C . V . . . D . L . . . T . N . .   2, 4
# . . . R . . . . . O . . . . . F . . . . . O . . .   6, 6

# W . . . . . . . C . . . . . . . L . . . . . . . E   8, 8
# . E . . . . . S . O . . . . . F . E . . . . . C .   6, 2
# . . A . . . I . . . V . . . D . . . E . . . N . .   4, 4
# . . . R . D . . . . . E . E . . . . . A . O . . .   2, 6
# . . . . E . . . . . . . R . . . . . . . T . . . .   8, 8

# W . . . . . . . . . V . . . . . . . . . T . . . .   10, 10
# . E . . . . . . . O . E . . . . . . . A . O . . .   8, 2
# . . A . . . . . C . . . R . . . . . E . . . N . .   6, 4
# . . . R . . . S . . . . . E . . . E . . . . . C .   4, 6
# . . . . E . I . . . . . . . D . L . . . . . . . E   2, 8
# . . . . . D . . . . . . . . . F . . . . . . . . .   10, 10
