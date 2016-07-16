class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    @strand.split('').each_with_index.select do |char, index|
      char != distance.split('')[index] unless distance.split('')[index] == nil
    end.count
  end
end
