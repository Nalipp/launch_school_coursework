NUM_ARR = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def integer_to_string(num)
  result = []
  loop do
    num, div = num.divmod(10)
    result << (NUM_ARR[div])
    break if num == 0
  end
  result.join.reverse
end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)
