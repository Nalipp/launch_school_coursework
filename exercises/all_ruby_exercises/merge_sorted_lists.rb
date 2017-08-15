def merge(arr1, arr2)
  merged_arr = arr1 + arr2

  results = []
  merged_arr.uniq.size.times do
    num = merged_arr.min
    merged_arr.count(num).times { results << num }
    merged_arr.delete(num)
  end
  results
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
