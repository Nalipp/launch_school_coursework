class Human < Player
  attr_accessor :name

  def choose_move
    puts "|    rock     |     paper     |    scissors    |"
    loop do
      print "Choice   : "
      self.choice = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors'].include?(self.choice)
      puts "Invalid choice"
    end
  end

  def set_name
    loop do
      print "Enter your name : "
      @name = gets.chomp.downcase
      break unless @name == nil
      puts "Name value required."
    end
  end
end
