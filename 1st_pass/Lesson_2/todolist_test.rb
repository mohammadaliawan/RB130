require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

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

  # Your tests go here. Remember they must start with "test_"

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
    removed_todo = @list.shift
    assert_equal(@todo1, removed_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    removed_todo = @list.pop
    assert_equal(@todo3, removed_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add("todo")
    end

    assert_raises(TypeError) do
      @list.add(1)
    end
  end

  def test_shovel
    todo4 = Todo.new("Go Shopping")
    @list << todo4
    @todos << todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Go Shopping")
    @list.add todo4
    @todos.push todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100)}
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(false, @list.item_at(2).done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @todos.each { |todo| todo.done!}
    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
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

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    value = @list.each { |todo| result << todo}
    assert_equal(@todos, result)
    assert_equal(value, @list)
  end

  def test_each_returns_original_list
    assert_equal(@list, @list.each {|todo| nil })
  end

  def test_select
   @todo1.done!
   list = TodoList.new(@list.title)
   list.add(@todo1)

   assert_equal(list.title, @list.title)
   assert_equal(list.to_s, @list.select{ |todo| todo.done?}.to_s)
  end
end