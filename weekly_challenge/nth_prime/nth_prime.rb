class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    index = 2
    return_arr = []
    while return_arr.length < num
      return_arr << index if prime?(index)
      index += 1
    end
    return_arr.last
  end

  def self.prime?(num)
    (2..Math.sqrt(num)).each { |divisor| return false if num % divisor == 0 }
  end
end
