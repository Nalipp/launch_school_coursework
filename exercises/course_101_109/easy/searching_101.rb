print "Enter the 1st number: "
  first = gets.chomp
print "Enter the 2nd number: "
  second = gets.chomp
print "Enter the 3rd number: "
  third = gets.chomp
print "Enter the 4th number: "
  fourth = gets.chomp
print "Enter the 5th number: "
  fifth = gets.chomp
print "Enter the last number: "
  last = gets.chomp

arr = [first, second, third, fourth, fifth]

if arr.include?(last)
  puts "The number #{last} appears in #{arr}"
else
  puts "The number #{last} does not appear in #{arr}"
end
