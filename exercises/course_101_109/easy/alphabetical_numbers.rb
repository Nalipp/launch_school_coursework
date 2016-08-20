ALPHA_ARR = %w(zero one two three four five six seven eight nine ten eleven twelve
               thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  ALPHA_ARR.sort.map { |word| ALPHA_ARR.find_index(word) }
end

# alphabetic_number_sort((0..19).to_a)
