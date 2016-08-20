require 'pry'

class Element
  attr_reader :obj

  def initialize(obj, *objs)
    @obj = [obj]
    @obj += objs unless objs.include?(nil)
  end

  def datum
    obj.last
  end

  def tail?
    [obj].last
  end

  def next
    obj.fetch(1, nil)
  end
end

class SimpleLinkedList < Element
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.size == 0
  end

  def push(obj)
    list.push(obj)
  end

  def peek
    list.first
  end

  def head
    obj = list.first
    objs = list[1..-1].empty? ? nil : list[1..-1]
    Element.new(obj, objs)
  end
end

# element = Element.new("a")
# p element.next
