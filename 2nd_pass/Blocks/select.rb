
def select(ary)
  # create a new array
  # iterate through the array yielding each element to the block
    # if the block's return value is truthy
      # save the current elment to the new array
    # otherwise, move on to the next element in the array
  # return the new array

  new_ary = []
  index = 0

  while index < ary.size
    if yield(ary[index])
      new_ary << ary[index]
    end

    index += 1
  end

  new_ary
end

ary = [1,2,3,4,5,6,7,8,9]

p select(ary) { |ele| puts ele }