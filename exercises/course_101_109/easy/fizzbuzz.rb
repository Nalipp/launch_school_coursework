def fizzbuzz(min, max)
  (min..max).map do |num|
    if num % 3 == 0 && num % 5 == 0
      'fizzbuzz'
    elsif num % 3 == 0
      'fizz'
    elsif num % 5 == 0
      'buzz'
    else
      num
    end
  end
end

p fizzbuzz(1, 15)
