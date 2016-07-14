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

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

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

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    @todos.each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(title)
    @todos.select { |todo| todo.title == title }.first
  end

  def all_done
    @todos.select { |todo| todo.done? }
  end

  def all_not_done
    @todos.select { |todo| !todo.done? }
  end

  def mark_done(title)
    @todos.each do |todo|
      if todo.title == title
        return todo.done!
      end
    end
  end

  def mark_all_done
    @todos.each { |todo| todo.done! }
  end

  def mark_all_undone
    @todos.each { |todo| todo.undone! }
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |item| puts item }
  end

  def to_a
    @todos
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# p list.find_by_title("Buy milk")
# p list.all_done
# p list.all_not_done
p list.mark_done('Buy milk')
# p list.mark_all_done
# p list.mark_all_undone

puts list




# find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
# all_done	returns new TodoList object containing only the done items
# all_not_done	returns new TodoList object containing only the not done items
# mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.
# mark_all_done	mark every todo as done
# mark_all_undone	mark every todo as not done

############################################################################################################

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
#
# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)
#
# todo1.done!
#
# results = list.select { |todo| todo.done? }
#
# p results

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end


############################################################################################################

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
