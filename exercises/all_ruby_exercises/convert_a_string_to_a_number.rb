NUM_HASH = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
           "7" => 7, "8" => 8, "9" => 9}

def string_to_integer(str)
  digits = str.chars.map { |char| NUM_HASH[char] }

  result = 0
  digits.each { |digit| result = 10 * result + digit }
  result
end

p string_to_integer('4321')
p string_to_integer('570')
