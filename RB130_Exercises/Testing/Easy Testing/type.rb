require 'minitest/autorun'

# class NoExperienceError < StandardError
#   attr_reader :message

#   def initialize(message)
#     @message = "Experience is less than 5 years"
#   end
# end

# class Employee
#   def initialize(experience)
#     @experience = experience
#   end

#   def hire
#     if @experience <= 5
#       raise NoExperienceError, "Experience is less than 5 years"
#     end
#   end

# end

class MixTests < Minitest::Test

  def test_instance_of
    value = Numeric.new
    assert_instance_of Numeric, value
  end
end