def substrings_at_start(str)
  str.chars.each_with_index.map { |_, idx| str[0..idx] }
end

def substrings(str)
  str.chars.each_with_index.map { |_, idx| substrings_at_start(str[idx..-1]) }.flatten
end

# p substrings('abcde')
#
# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]
