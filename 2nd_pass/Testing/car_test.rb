require 'minitest/autorun'


require_relative 'car'

class CarTest < Minitest::Test
  def setup
    @car = Car.new
    @car2 = Car.new
    
    @car.name = "Ali"
    @car2.name = "Ali"
  end

  def test

  def test_value_equality
    assert_equal(@car, @car2)
  end

  def test_object_equality
    assert_same(@car, @car2)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_car_exists
    assert(@car)
  end

  # def test_name_is_nil
  #   assert_nil(@car.name)
  # end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1,2,3]
    arr << @car

    assert_includes(arr, @car)
  end
end