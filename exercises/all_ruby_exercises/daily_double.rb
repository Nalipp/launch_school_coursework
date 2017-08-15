def crunch(str)
  last_char = nil
  result = []
  str.chars.each do |char|
    result << char if char != last_char
    last_char = char
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
