def bannerizer(str)
  str = str[0..75] if str.length > 75
  horizontal_line = "+" + "-"*(str.length+2) + "+"
  vertical_line = "|" + " "*(str.length+2) + "|"

  puts horizontal_line
  puts vertical_line
  puts "| #{str} |"
  puts vertical_line
  puts horizontal_line
end

bannerizer('To boldly go where no one has gone before. For the first time since there has ever been anything worth watching on the tree next to the grocery station.')
