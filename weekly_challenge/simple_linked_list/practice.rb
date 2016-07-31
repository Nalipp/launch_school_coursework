require 'pry'

# def test(one, *objs)
#   p one
#   p objs if :objs
# end
#
#
# test('hi')

class Element
  attr_reader :obj

  def initialize(obj, *objs)
    @obj = [obj]
    binding.pry
    @obj << objs unless objs.include?(nil)
  end
end

e = Element.new(1, nil)
p e
