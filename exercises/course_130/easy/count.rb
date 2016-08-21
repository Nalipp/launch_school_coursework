def count(arr)
  count = 0
  arr.each { |num| count += 1 if yield(num)}
  count
end

# p count([1, 3, 6]) { |value| value.odd? } == 2
# p count([1, 3, 6]) { |value| value.even? } == 1
# p count([1, 3, 6]) { |value| value > 6 } == 0
# p count([1, 3, 6]) { |value| true } == 3
# p count([]) { |value| true } == 0
# p count([1, 3, 6]) { |value| value - 6 } == 3
