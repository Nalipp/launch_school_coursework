def dimond(num)
  num -= 1 if num.even?
  dimond_top(num) + dimond_bottom(num)
end

def dimond_top(num)
  stars = 1
  (num/2).downto(0) do |index|
    puts " "* (index) + "*"*(stars)
    stars += 2
  end
end

def dimond_bottom(num)
  (num/2).times do |index|
    puts " "* (index + 1) + "*"*(num - 2)
    num -= 2
  end
end

dimond(8)
