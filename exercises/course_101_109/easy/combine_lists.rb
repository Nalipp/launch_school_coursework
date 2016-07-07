# def interleave(arr1, arr2)
#   p arr1.zip(arr2).flatten
# end

def interleave(arr1, arr2)
  return_arr = []
  arr1.each_with_index do |index|
    return_arr << [arr1[index-1], arr2[index-1]]
  end
  return_arr.flatten
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
