=begin
write a method each_with_index
take an array as an argument and a block
yield each element and its index to the block
return a refernce to the calling array

given an array
initialize an index to 0
iterate through the array
  - yield current element and its index to the block
  - increment index by 1
- return the calling array
=end

def each_with_index(ary)
  index = 0

  ary.each do |ele|
    yield(ele, index)
    index += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]