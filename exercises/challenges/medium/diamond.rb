class Diamond

  def self.make_diamond(letter)
    return "A\n" if letter == "A"
    widths = create_hash(letter)
    print_top(letter, widths)
    print_botom(letter, widths)
  end

  def self.create_hash(letter)
    count = 3
    ("B"..letter).to_a.each_with_object({}) do |l, hash|
      hash[l.to_sym] = count
      count += 2
    end
  end

  def self.print_top(letter, widths)
    max_width = widths[letter.to_sym]
    puts " "*(max_width / 2) + "A"
    widths.each do |l, num|
      space = (max_width - widths[l.to_sym]) / 2
      puts " "*space + l.to_s + " "*(num-2) + l.to_s + " "*space + "\n"
      break if num == max_width - 2
    end
  end

  def self.print_botom(letter, widths)
    max_width = widths[letter.to_sym]
    widths.reverse_each do |l, num|
      space = (max_width - widths[l.to_sym]) / 2
      puts " "*space + l.to_s + " "*(num-2) + l.to_s + " "*space + "\n"
    end
    puts " "*(max_width / 2) + "A"
  end
end

# Diamond.make_diamond('F')

#     A
#    B B     3
#   C   C    5
#  D     D   7
# E       E  9
#F         F 11
# E       E  9
#  D     D
#   C   C
#    B B
#     A
