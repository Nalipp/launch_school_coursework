class Human
  attr_accessor :name, :move
  attr_reader :moves

  def initialize
    @moves = []
  end

  def set_name
    loop do
      print "Enter name : "
      self.name = gets.chomp.downcase
      break unless self.name == nil
      puts "Name value required"
    end
  end

  def set_choice
    mv = ''
    loop do
      print "Choose :  |  rock  |  paper  | scissors | "
      mv = gets.chomp.downcase
      break if ['paper', 'rock', 'scissors'].include?(mv)
      puts 'Not a valid choice'
    end
    @moves << self.move = Move.new(mv)
    @moves.last
  end
end
