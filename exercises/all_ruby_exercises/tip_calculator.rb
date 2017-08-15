print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
percentage = gets.chomp.to_f

tip = bill * (percentage * 0.01)
total = tip + bill

puts "The tip is $ #{'%.2f' % tip}"
puts "The total is $ #{'%.2f' % total}"
