def each_with_index(arr)
  count = 0
  arr.each do |value|
    yield(value, count)
    count += 1
  end
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
