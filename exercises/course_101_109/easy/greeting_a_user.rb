print "What is you name? "
name = gets.chomp

if name[-1] == '!'
  copy = name[0..-2]
  puts "HELLO #{copy.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
