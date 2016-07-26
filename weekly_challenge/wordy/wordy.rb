require 'pry'

class WordProblem
  attr_reader :string

  def initialize(string)
    @string = string.gsub(' by', '')
  end

  def clean_string
    string.split[2..-1]
  end

  def calculate(int1, operation, int2)
    raise ArgumentError unless %w[plus minus multiplied divided].include?(operation)
    return int1.to_i + int2.to_i if operation == 'plus'
    return int1.to_i - int2.to_i if operation == 'minus'
    return int1.to_i * int2.to_i if operation == 'multiplied'
    return int1.to_i / int2.to_i if operation == 'divided'
  end

  def answer
    current_total = string.split[2]
    count = 0
    return_arr = []

    (clean_string.length / 2).times do
      int1 = current_total
      operation = clean_string[count+1]
      int2 = clean_string[count+2]

      return_arr << calculate(int1, operation, int2)
      current_total = return_arr.last
      count += 2
    end
    return_arr.last
  end
end
