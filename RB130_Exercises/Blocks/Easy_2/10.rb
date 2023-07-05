=begin
when to sto iterating:

[1,2,3,4], 3 -> [1,2,3], [2,3,4] -> stop iterating when index = -n

[1,2,3,4,5], 3 -> arysize - n = 5 - 3 = 2
 0 1 2 3 4

 index of last element <= last index of the array
 current index  + n-1 <= ary.size - 1
 2 + 3 - 1 <= 5 - 1
 4 <= 4

 3 + 3 - 1 <= 4
 5 <= 4


=end

def each_cons(ary, n)
  ary.each_index do |idx|
    if idx <= ary.size - n
      yield(*ary[idx,n])
    end
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}