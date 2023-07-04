=begin
- given a varying long list of arguments 0 or more and a block
- return the number of arguments for which the block returns a truthy value

Algo:
- define a method that takes n arguments
- initialize a counter to 0
- iterate over the given arguments
  - yield to block and pass in the current argument
  - if the return value of the block is truthy
    - increment counter by 1
- return the counter
=end

def count(*args)
  counter = 0

  args.each do |curr_arg|
    if yield(curr_arg)
      counter += 1
    end
  end

  counter
end

p count(1, 3, 6) { |value| value.odd? } #== 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3