def times(int)
  counter = 0

  while counter < int
    yield(counter)
    counter += 1
  end

  int
end

p times(5) { |num|
  puts num
}