=begin
write a method that takes an array and a block
- yield each consecutive pair of elements to the block
- return nil


number of iterations depends on how many pairs there are
[1,2,3,4] -> 1,2 2,3 3,4 when reach last index stop making pairs
[1,2,3] -> 1,2 2,3
[1,2,3,4,5,6] -> 1,2 2,3 3,4 4,5 5,6

number of pairs is array size - 1

iterate through the indices of the array
  - if index < last index
    - yield to the bloc and pass in subarray from current index to index +1


=end

def each_cons(ary)
  ary.each_index do |idx|
    if idx < ary.size - 1
      yield(ary[idx,2])
    end
  end

  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil