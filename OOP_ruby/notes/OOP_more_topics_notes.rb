require 'pry'

# p [1, 2, 3].reduce { |acc, num| acc + num } #6
# p [1, 2, 3].reduce { |acc, num| acc + num if num.odd? } #error
# p [1, 2, 3].reduce(10) { |acc, num| acc + num } #16

def reduce(arr, acc=0)
  counter = 0
  return_acc = 0
  while counter < arr.length
    # binding.pry
    return_acc += (acc + arr[counter])
    counter += 1
  end
  return_acc
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
