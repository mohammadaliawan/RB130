def reduce(ary, starting_value = nil)
  # iterate through the array yielding current ele and acc to the blocl
  # assign the return value of the block to acc on each iteration
  # return the acc

  unless starting_value
    acc = ary[0]
    index = 1
  else
    acc = starting_value
    index = 0
  end

  while index < ary.size
    acc = yield(acc, ary[index])

    index += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']