print "what is your age? "
current_age = gets.chomp.to_i
print "What age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year
number_of_years_remaining = retirement_age - current_age
retirement_date = number_of_years_remaining + 2016

puts "It's #{current_year}, You will retire in #{retirement_date}"
puts "You only have #{number_of_years_remaining} years remaining"
