=begin
Requirements:
- write a method drop while
- takes an array as arg and a block
- return a new array
- new array should contain
  - the first element from the begininng of the array for which the block returns false
  - and all the remaining elements after the above element
- if given array is empty or if block returns true for all elements
    - return empty array


- Given an array of 0 or more elements
- find the index of the first element for which block returns false
- create a new array that is a subarray of the elements from above index to last index
  - if there is no index for which block returns false, return an empty array

- find the index of the first element for which block returns false
    - iterate through the array with index
      - if block returns false for current index element
        - return current index
    - if no index found return nil
=end

def drop_while(ary)
  first_index = nil
  ary.each_index do |index|
    unless yield(ary[index])
      first_index = index
      break
    end
  end

  if first_index
    ary[first_index..-1]
  else
    []
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []