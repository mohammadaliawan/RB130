=begin
given two arrays with the same number of elements
return a new array that:
  - has array size number of elements
  - each element is a two element array where the first element is
  from the first array at the same index and second element is
  from the second array at the same index


=end

def zip(ary1, ary2)
  ary1.map.with_index do |ele, idx|
    [ele, ary2[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]