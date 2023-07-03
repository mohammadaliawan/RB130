require 'minitest/autorun'

class Cat
  def initialize(arg)
  end
end


class CatTest < Minitest::Test
  def test_raise_error
    assert_equal(ArgumentError, Cat.new)
    assert_instance_of(Cat, Cat.new("Kitty"))
  end
end