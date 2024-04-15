def each_with_index(ary)
  index = 0

  while index < ary.size
    yield(ary[index], index)

    index += 1
  end

  ary
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]