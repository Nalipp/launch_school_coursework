puts "Welcome to Calculator"
puts "What's the first number?"
num1 = gets.chomp.to_i
puts "What operstion would you like to preform? 1)add 2)subtract 3)multiply 4)divide"
opp = gets.chomp
puts opp
puts "What's the second number?"
num2 = gets.chomp.to_i

def calculator(num1, opp, num2)
  if opp == "1"
    num1 + num2
  elsif opp == "2"
    num1 - num2
  elsif opp == "3"
    num1 * num2
  else
    num1.to_f / num2.to_f
  end
end

answer = calculator(num1, opp, num2)

puts "The answer is #{answer}"
