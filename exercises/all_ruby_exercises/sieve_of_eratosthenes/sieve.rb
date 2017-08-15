class Sieve
  def initialize(max_number)
    @max_number = max_number
  end

  def primes
    (2..@max_number-1).select { |num| is_prime?(num) }
  end

  private
  
  def is_prime?(number)
    (2..Math.sqrt(number)).each { |num| return false if number % num == 0 }
  end
end
