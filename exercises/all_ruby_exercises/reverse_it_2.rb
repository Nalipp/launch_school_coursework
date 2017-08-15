def reverse_words(string)
  string.split.map do |word|
    word.length > 4 ? word.reverse : word
  end.join(' ')
end

p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS
