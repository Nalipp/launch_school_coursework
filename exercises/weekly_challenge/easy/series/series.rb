class Series
  def initialize(numbers)
    @numbers = numbers
  end

  def get_slice(min, max)
    @numbers.slice(min..max).chars.map(&:to_i)
  end

  def slices(slice_times)
    raise ArgumentError if slice_times > @numbers.length

    results = []
    @numbers.length.times do |idx|
      max = ((slice_times + idx) - 1)
      break if get_slice(idx, max).length < slice_times
      results << get_slice(idx, max)
    end
    results
  end
end
