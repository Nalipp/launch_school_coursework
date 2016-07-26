require 'pry'

class Crypto

  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    @string.split.join.downcase.gsub(/\W+/, '')
  end

  def size
    if root(normalize_plaintext.size) % root(normalize_plaintext.size).to_i == 0
      root(normalize_plaintext.size)
    else
      root(normalize_plaintext.size).to_i + 1
    end
  end

  def plaintext_segments
    return_arr = []
    copy = normalize_plaintext
    size.times do
      return_arr << copy.slice!(0...size)
    end
    return_arr.reject { |str| str == "" }
  end

  def ciphertext
    return_arr = []
    size.times do |idx|
      return_arr << return_at_index(idx)
    end
    return_arr.join
  end

  def return_at_index(base)
    count = base
    return_arr = []
    ((normalize_plaintext.length / size) + 1).times do
      return_arr << normalize_plaintext.slice(count)
      count += size
    end
    return_arr.join
  end

  def normalize_ciphertext
    return_arr = []
    copy = ciphertext
    size.times do
      return_arr << copy.slice!(0...size - 1)
    end
    return_arr.reject { |str| str == "" }.join(' ')
  end

  def root(num)
    Math.sqrt(num)
  end
end

# crypto = Crypto.new('Vampires are people too!')
# p crypto.normalize_ciphertext
 # 'vrel aepe mset paoo irpo'
