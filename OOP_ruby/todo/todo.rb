class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    self.done == true
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ?DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# puts todo1
# puts todo2
# puts todo3

# todo1.done!
# puts ''
# puts todo1
# puts todo2
# puts todo3
