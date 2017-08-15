def zipper(arr1, arr2)
  results = []
  (arr1.length).times do |num|
    results << [arr1[num], arr2[num]]
  end
  results
end
