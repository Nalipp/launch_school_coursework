METERS_CONVERSION = 10.7639

print "Enter the length of the room in meters: "
length = gets.chomp.to_f
print "Enter the width of the room in meters: "
width = gets.chomp.to_f

area = length * width
square_feet = (area * METERS_CONVERSION).round(2)
puts "The area of the room is #{area} square meters (#{square_feet} square feet)."
