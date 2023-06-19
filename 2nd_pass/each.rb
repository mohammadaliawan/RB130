def each(ary)
  index = 0

  while index < ary.size
    yield(ary[index])
    index += 1
  end

  # loop do 
  #   yield(ary[index])
  #   index += 1

  #   break unless index < ary.size
  # end

  # ary.each do |element|
  #   yield(element)
  # end
end

each([1,2,3]) do |ele|
  puts "#{ele} Hello"
end