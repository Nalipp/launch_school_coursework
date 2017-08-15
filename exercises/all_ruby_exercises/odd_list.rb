def oddities(arr)
  arr.select.each_with_index { |arr, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
