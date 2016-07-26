class SumOfMultiples
  def initialize(*multiples)
    @multiples = *multiples
  end

  def self.to(num)
    new(3, 5).to(num)
  end

  def to(num)
    sum_of_multiples(num)
  end

  private

  def arr_of_multiples(num)
    @multiples.each_with_object([]) do |multiples, arr|
      arr << (0...num).select { |number| number % multiples == 0 }
    end
  end

  def sum_of_multiples(num)
    arr_of_multiples(num).flatten.uniq.inject(:+)
  end
end
