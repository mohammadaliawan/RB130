require 'minitest/autorun'

class Employee
  def initialize(experience)
    @experience = experience
  end

  def hire
    if @experience < 5
      raise NoExperienceError, "Experience is less than 5 years"
    end
  end

end

bob = Employee.new(2)

bob.hire

class MixTests < Minitest::Test

  def test_raise_noexperience
    employee = Employee.new(2)

    assert_raises (NoExperienceError) {employee.hire}

  end
end