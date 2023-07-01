class Vehicle

end


class Car < Vehicle
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other_car)
    other_car.instance_of?(Car) && name == other_car.name
  end
end

