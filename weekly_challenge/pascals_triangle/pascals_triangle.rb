\class Triangle
  attr_reader :base, :triangle

  def initialize(base)
    @base = base
    @triangle = [[1]]
  end

  def rows
    base.times do |idx|

    end
  end
end

triangle = Triangle.new(4)
p triangle.rows
