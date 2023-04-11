# Method Implementation
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end

  number
end

# Method Invocation
times(5) do |num|
  puts "#{num}. Hello"
end

