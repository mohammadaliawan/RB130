class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def undone
    self.done = false
  end

  def done?
    done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :todos, :title

  def initialize(name)
    self.title = name
    self.todos = []
  end

  def add(todo)
    if todo.instance_of? Todo
      todos.push(todo)
    else
      raise TypeError, 'Can only add Todo Objects'
    end
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done?}
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone
  end

  def done!
    todos.each { |todo| todo.done!}
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    if item_at(index)
      todos.delete_at(index)
    end
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def each
    index = 0

    while index < size
      yield(item_at(index))

      index += 1
    end

    self
  end

  def select(name = "Selected Todos")
    result = TodoList.new(name)

    each do |todo|
      result.add(todo) if yield(todo)
    end

    result
  end

  def find_by_title(name)
    each do |todo|
      return todo if todo.title == name
    end
    nil
  end

  def all_done
    select("All Done") { |todo| todo.done?}
  end

  def all_not_done
    select("All Not Done") { |todo| !todo.done?}
  end

  def mark_done(title)
    if find_by_title(title)
      find_by_title(title).done!
    end
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone
    end
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Take care of Kids")
list = TodoList.new("Today's Todos")

# add
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

list.mark_all_done
puts list

list.mark_all_undone
puts list

