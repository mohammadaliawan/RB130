=begin
take an array and a block
returns the element for which the block returned the largest value
if given array is empty return nil

initialize max_ele to first element
iterate through the array
  - yield current element to block
  - if return value of block is greater than max_ele
      - reassign max_ele to current element
return max_ele
=end

def max_by(ary, &block)
  max_ele = ary.first

  ary.each do |ele|
    if block.call(ele) > block.call(max_ele)
      max_ele = ele
    end
  end

  return max_ele
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil