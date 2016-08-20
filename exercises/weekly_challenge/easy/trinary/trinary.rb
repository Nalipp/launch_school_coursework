class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number.to_i == 0

    count = @number.length
    @number.chars.inject(0) do |sum, num|
      count -= 1
      sum += num.to_i * 3**count
    end
  end
end
