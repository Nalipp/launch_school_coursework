class PerfectNumber
  def self.find_divisors(num)
    (1..num-1).select { |divisor| num % divisor == 0 }
  end

  def self.deficient?(num)
    num > find_divisors(num).inject(:+)
  end

  def self.perfect?(num)
    num == find_divisors(num).inject(:+)
  end

  def self.abundant?(num)
    num < find_divisors(num).inject(:+)
  end

  def self.classify(num)
    raise RuntimeError, "Number must be positive" if num < 0
    return 'perfect' if perfect?(num)
    return 'deficient' if deficient?(num)
    return 'abundant' if abundant?(num)
  end
end
