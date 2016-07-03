puts "What is the bears name?"
name = gets.chomp.downcase
name = "teddy" if name.empty?

age = rand(2..200)
puts "#{name.capitalize} is #{age} years old!"
