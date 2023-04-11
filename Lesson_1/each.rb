def each(ary)
  index = 0

  while index < ary.size
    yield(ary[index])
    index += 1
  end

  ary
end


array = [1, 2, 3, 4, 5]

each(array) do |num|
  puts "Hello #{num}"
end