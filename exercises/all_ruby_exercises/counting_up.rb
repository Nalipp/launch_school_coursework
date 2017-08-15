def sequence(num)
  num.negative? ? num.upto(0).to_a : (1..num).to_a
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
#
# p sequence(-5)
