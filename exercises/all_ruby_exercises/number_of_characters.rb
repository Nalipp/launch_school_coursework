print "Please write word or multiple words: "
characters = gets.chomp
num = characters.delete(' ').length

puts "There are #{num} characters in \"#{characters}\"."
