def halvsies(arr)
  arr.length.even? ? half = (arr.length / 2)-1 : half = arr.length / 2
  [arr[0..half], arr[half+1..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
