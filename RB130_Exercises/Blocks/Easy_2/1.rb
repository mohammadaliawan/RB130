=begin
- given 3 arguments
  - the starting value
  - the ending value
  - the step value (applied to each iteration)
- also takes a block, to which each successive iteration value
will be yielded.

- What should be the return value of this method and why

step(1, 10, 3) { |value| puts "value = #{value}" }

Output:
value = 1
value = 4
value = 7
value = 10

- Given a starting integer, step integer and last integer
- iterate from starting integer to last integer using step integer
  - yield to the block on each iteration

Given START_NUM, LAST_NUM, STEP

NEXT_NUM = START_NUM

WHILE NEXT_NUM <= LAST_NUM
  YIELD(NEXT_NUM)

  INCREMENT NEXT_NUM BY STEP
END

RETURN (START_NUM..LAST_NUM)

=end

def step(start_num, last_num, step_num)
  next_num = start_num

  while next_num <= last_num
    yield(next_num)

    next_num += step_num
  end

  start_num..last_num
end

p step(1, 10, 3) { |value| puts "value = #{value}" }