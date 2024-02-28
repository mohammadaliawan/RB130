require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
    refute_includes(@list.to_a, @todo1)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
    @list.done!
    assert(@list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add(2)
    end
  end

  def test_shovel
    @todo4 = Todo.new("Go to Office")
    @list << @todo4

    assert_includes(@list.to_a, @todo4)
  end

  def test_add
    @todo4 = Todo.new("Go to Office")
    @list.add @todo4

    assert_includes(@list.to_a, @todo4)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_item_at_raises
    assert_raises(IndexError) do
      @list.item_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(0)

    assert(@todo1.done?)
    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
    refute(@todo2.done?)
    refute(@todo3.done?)
  end

  def test_mark_undone_at
    @list.done!
    @list.mark_undone_at(0)
    refute(@list.item_at(0).done?)
    assert(@list.item_at(1).done?)
    assert_raises(IndexError) { @list.mark_undone_at(100)}
  end

  def test_done!
    @list.done!

    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_remove_at
    todo = @list.remove_at(2)

    refute_includes(@list.to_a, @todo3)
    assert_equal(@todo3, todo)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @todo2.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo}
    assert_equal(@todos, result)
  end

  def test_each_return
    return_value = @list.each { |todo|}
    assert_equal(@list, return_value)
  end

  def test_select
    expected_list = TodoList.new("Test List")
    expected_list.add(@todo1)
    @todo1.done!

    selected_todos = @list.select { |todo| todo.done?}

    assert_equal(expected_list, selected_todos)
  end
  
end