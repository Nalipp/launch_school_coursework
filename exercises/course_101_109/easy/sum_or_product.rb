def calculate_sum(num)
  (1..num.to_i).inject(&:+)
end

def calculate_product(num)
  (1..num.to_i).inject(&:*)
end

puts ">> Please enter an integer greater than 0 : "
num = gets.chomp
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

if operator == 's'
  p "The sum of the integers between 1 and #{num} is #{calculate_sum(num)}."
elsif operator == 'p'
  p "The product of the integers between 1 and #{num} is #{calculate_product(num)}."
else
  p "Invalid choice"
end
