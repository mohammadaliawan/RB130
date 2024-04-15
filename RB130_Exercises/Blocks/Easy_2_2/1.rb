# Problem
# write a method
# takes 3 arguments
# start value, end value, step value
# method should take a block to which it yields step values
# iteration will start with tthe start value
# each successive value will be previous iteration value + step value
# iteration will end when the next iteration value is greater than end value

# Algo
# Given three integers, start, end, step and a block
# current value = start
# iterate from start to end
  # on each iteration yield to the block and pass in current value
  # increment current value by step
  # stop iterating when current value becomes greater than end value


def step(start, end_value, step_value)
  current_value = start

  loop do
    yield(current_value)

    current_value += step_value
    break if current_value > end_value
  end

  start..end_value
end

p step(1, 10, 3) { |value| puts "value = #{value}" }