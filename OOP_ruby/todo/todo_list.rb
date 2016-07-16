require_relative ('todo')
require_relative ('errors')

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
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

  def all_dones
    @todos.select { |todo| todo.done? }
  end

  def all_not_dones
    @todos.select { |todo| !todo.done? }
  end

  def mark_done(title)
    @todos.each do |todo|
      if todo.title == title
        return todo.done!
      end
    end
  end

  def mark_all_done!
    @todos.each { |todo| todo.done! }
  end

  def mark_all_undone!
    @todos.each { |todo| todo.undone! }
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end
end
