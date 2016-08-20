def find_dup(arr)
  arr.detect { |num| arr.count(num) == 2 }
end

# p find_dup([1, 5, 3, 1])
