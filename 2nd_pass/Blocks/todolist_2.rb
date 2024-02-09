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
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other_todo)
    title == other_todo.title &&
      description == other_todo.description &&
      done == other_todo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      todos << todo
    else
      raise TypeError, "Can only add Todo objects"
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

  def done!
    todos.each { |todo| todo.done!}
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    selected_todos = TodoList.new("Selected Todos")
    each do |todo|
      if yield(todo)
        selected_todos.add(todo)
      end
    end

    selected_todos
  end

  def find_by_title(match_title)
    select { |todo| todo.title == match_title}.first
  end

  def all_done
    select { |todo| todo.done?}
  end

  def all_not_done
    select { |todo| !todo.done?}
  end

  def mark_done(match_title)
    find_by_title(match_title) && find_by_title(match_title).done!
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each { |todo| todo.undone!}
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.<<(todo3)                 # adds todo3 to end of list, returns list

list.mark_done_at(1)
list.mark_done_at(2)

