require_relative ('todo')
require_relative ('errors')

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, " Can only add Todo objects" unless todo.class == Todo
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def item_at(num)
    @todos.fetch(num)
  end

  def mark_done_at(num)
    @todos.fetch(num).done!
  end

  def mark_undone_at(num)
    @todos.fetch(num).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(num)
    @todos.delete_at(num) if @todos.fetch(num)
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |item| puts item }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)
# list.add(1)                     # returns TypeError

list.size                       # returns 3
list.first                      # returns todo1, which is the first item in the list
list.last                       # returns todo3, which is the last item in the list

# list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# p list.size
# p list.shift
# p list.size

# p list.size
# p list.pop
# p list.size

# p list.size
# p list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list.remove_at(100)             # raises IndexError
# p list.size

# list.to_s
