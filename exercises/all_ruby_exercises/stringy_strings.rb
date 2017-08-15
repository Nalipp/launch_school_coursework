def stringy(num)
  results = []
  num.times do |num|
    num.odd? ? results << "0" : results << "1"
  end
  results.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
