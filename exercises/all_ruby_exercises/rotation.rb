def rotate_array(arr)
  arr[1..-1] + arr[0..0]
end

def rotate_rightmost_digits(digits, n) # rotates the last n digits of a number
  digits = digits.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

def max_rotation(digits)
  index = digits.to_s.length
  while index > 1
    digits = rotate_rightmost_digits(digits, index)
    index -= 1
  end
  digits
end
