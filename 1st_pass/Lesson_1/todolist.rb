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
    description == other &&
    done == other_todo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "can only add Todo Objects" unless todo.instance_of? Todo

    todos << todo
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
    todos.clone
  end

  def done?
    todos.all? {|todo| todo.done?}
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

  def done!
    todos.each do |todo|
      todo.done!
    end
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
    heading = "---- #{title} ----"
    todos.reduce(heading) {|acc, todo| acc + "\n" + todo.to_s }
  end

  def each
    counter = 0

    while counter < size
      yield(item_at(counter))

      counter += 1
    end

    self
  end

  def select
    new_list = TodoList.new(title)

    self.each do |todo|
      if yield(todo)
        new_list << todo
      end
    end

    new_list
  end

  def find_by_title(search_title)
    select { |todo| todo.title == search_title}.first
  end

  def all_done
    select { |todo| todo.done?}
  end

  def all_not_done
    select { |todo| !todo.done?}
  end

  def mark_done(title)
    if find_by_title(title)
      find_by_title(title).done!
    end
  end

  def mark_all_done
    each { |todo| todo.done!}
  end

  def mark_all_undone
    each { |todo| todo.undone!}
  end
  
  private

  attr_accessor :todos

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list << todo1
list << todo2
list << todo3

p list.find_by_title("Clean room")

