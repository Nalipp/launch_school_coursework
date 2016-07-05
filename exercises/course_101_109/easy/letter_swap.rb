def swap_first_last_char(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(str)
  str.split(' ').map { |word| swap_first_last_char(word) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
