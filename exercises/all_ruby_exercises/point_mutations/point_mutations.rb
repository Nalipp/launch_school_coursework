class DNA
  attr_reader :strand1

  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    short = find_shortest(strand1, strand2)
    long = find_shortest(strand1, strand2) == strand1 ? strand2 : strand1

    long[0...short.length].split('').zip(short.split('')).count { |a, b| a != b }
  end

  private

  def find_shortest(strand1, strand2)
    strand1.size >= strand2.size ? strand2 : strand1
  end
end
